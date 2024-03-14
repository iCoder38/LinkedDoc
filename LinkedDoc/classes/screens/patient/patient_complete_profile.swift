//
//  patient_complete_profile.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 14/03/24.
//

import UIKit
import Alamofire

class patient_complete_profile: UIViewController {
    
    var str_token:String! = ""
    
    @IBOutlet weak var view_navigation:UIView! {
        didSet {
            view_navigation.backgroundColor = navigation_color
        }
    }
    @IBOutlet weak var lbl_navigation_title:UILabel! {
        didSet {
            lbl_navigation_title.textColor = .white
        }
    }
    
    @IBOutlet weak var btn_back:UIButton! {
        didSet {
            btn_back.tintColor = .white
            btn_back.isHidden = true
        }
    }
    
    @IBOutlet weak var tble_view:UITableView! {
        didSet {
            tble_view.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        self.view.backgroundColor = app_bg_color
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
    }
    
    @objc func finish_click_method() {
        self.complete_profile_account_WB()
        
    }
    
    
    @objc func complete_profile_account_WB() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! patient_complete_profile_table_cell
        
        if (cell.txt_complete_address.text == "") {
            return
        }
        if (cell.txt_area_zipcode.text == "") {
            return
        }
        if (cell.txt_gender.text == "") {
            return
        }
        if (cell.txt_weight.text == "") {
            return
        }
        if (cell.txt_blood_group.text == "") {
            return
        }
        
        self.view.endEditing(true)
        var parameters:Dictionary<AnyHashable, Any>!
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]
                
                parameters = [
                    "action"        : "editprofile",
                    "userId"        : String(myString),
                    "address"       : String(cell.txt_complete_address.text!),
                    "zipcode"       : String(cell.txt_area_zipcode.text!),
                    "gender"        : String(cell.txt_gender.text!),
                    "weight"        : String(cell.txt_weight.text!),
                    "BloodGroup"    : String(cell.txt_blood_group.text!),
                   
                ]
                
                print("parameters-------\(String(describing: parameters))")
                
                AF.request(application_base_url, method: .post, parameters: parameters as? Parameters, headers: headers).responseJSON {
                    response in
                    
                    switch(response.result) {
                    case .success(_):
                        if let data = response.value {
                            
                            let JSON = data as! NSDictionary
                            print(JSON)
                            
                            var strSuccess : String!
                            strSuccess = JSON["status"] as? String
                            
                            if strSuccess.lowercased() == "success" {
                                ERProgressHud.sharedInstance.hide()
                                
                                var dict: Dictionary<AnyHashable, Any>
                                dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                                
                                let defaults = UserDefaults.standard
                                defaults.setValue(dict, forKey: str_save_login_user_data)
                                
                                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dashboard_id")
                                self.navigationController?.pushViewController(push, animated: true)
                                
                            }
                            else {
                                self.generate_token()
                            }
                            
                        }
                        
                    case .failure(_):
                        print("Error message:\(String(describing: response.error))")
                        ERProgressHud.sharedInstance.hide()
                        self.please_check_your_internet_connection()
                        
                        break
                    }
                }
            } else {
                self.generate_token()
            }
        }
    }
    
    @objc func generate_token() {
        
        var parameters:Dictionary<AnyHashable, Any>!
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            parameters = [
                "action"    : "gettoken",
                "userId"    : String(myString),
                "email"     : (person["email"] as! String),
                "role"      : (person["role"] as! String)
            ]
        }
        
        print("parameters-------\(String(describing: parameters))")
        
        AF.request(application_base_url, method: .post, parameters: parameters as? Parameters).responseJSON {
            response in
            
            switch(response.result) {
            case .success(_):
                if let data = response.value {
                    
                    let JSON = data as! NSDictionary
                    print(JSON)
                    
                    var strSuccess : String!
                    strSuccess = JSON["status"] as? String
                    
                    if strSuccess.lowercased() == "success" {
                        
                        let str_token = (JSON["AuthToken"] as! String)
                        UserDefaults.standard.set("", forKey: str_save_last_api_token)
                        UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)
                        
                        self.complete_profile_account_WB()
                        
                    } else {
                        ERProgressHud.sharedInstance.hide()
                    }
                    
                }
                
            case .failure(_):
                print("Error message:\(String(describing: response.error))")
                ERProgressHud.sharedInstance.hide()
                self.please_check_your_internet_connection()
                
                break
            }
        }
    }
    
    
    
    @objc func gender_click_method() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! patient_complete_profile_table_cell
        
        let dummyList = [text_language.common_screen(status: "male"), text_language.common_screen(status: "female")]
        
        RPicker.selectOption(title: text_language.common_screen(status: "gender"), cancelText: text_language.common_screen(status: "dismiss"), dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
             
            cell.txt_gender.text = String(selctedText)
        }
    }
    
     
}

//MARK:- TABLE VIEW -
extension patient_complete_profile: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:patient_complete_profile_table_cell = tableView.dequeueReusableCell(withIdentifier: "patient_complete_profile_table_cell") as! patient_complete_profile_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        self.lbl_navigation_title.text = text_language.complete_profile_screen(status: "#01")
        
        cell.txt_complete_address.placeholder = text_language.complete_profile_screen(status: "#02")
        cell.txt_area_zipcode.placeholder = text_language.complete_profile_screen(status: "#03")
        cell.txt_gender.placeholder = text_language.complete_profile_screen(status: "#09")
        cell.txt_weight.placeholder = text_language.complete_profile_screen(status: "#10")
        cell.txt_blood_group.placeholder = text_language.complete_profile_screen(status: "#11")
        
        cell.btn_finish.setTitle(text_language.complete_profile_screen(status: "#07"), for: .normal)
        
        cell.btn_finish.addTarget(self, action: #selector(finish_click_method), for: .touchUpInside)
        
        cell.btn_gender.addTarget(self, action: #selector(gender_click_method), for: .touchUpInside)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1100
    }

}

