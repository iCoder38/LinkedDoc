//
//  update_profile.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 13/03/24.
//

import UIKit
import Alamofire

class update_profile: UIViewController, UITextFieldDelegate {
    
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
            btn_back.setImage(UIImage(systemName: "list.dash"), for: .normal)
        }
    }
    
    @IBOutlet weak var tble_view:UITableView! {
        didSet {
            tble_view.backgroundColor = app_bg_color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.sideBarMenu(button: self.btn_back)
    }
    
    @objc func parse_data_from_server() {
        
    }
    @objc func continue_click_method2() {
        Utils.light_vibrate()
        
        self.create_an_account()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @objc func create_an_account() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! updating_profile_table_cell
        
        if (cell.txt_name.text == "") {
            return
        }
        if (cell.txt_email.text == "") {
            return
        }
        if (cell.txt_phone.text == "") {
            return
        }
        self.view.endEditing(true)
        var parameters:Dictionary<AnyHashable, Any>!
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "updating"))
        
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
                    "fullName"      : String(cell.txt_name.text!),
                    "email"         : String(cell.txt_email.text!),
                    "contactNumber" : String(cell.txt_phone.text!),
                    "role"          : (person["role"] as! String),
                    "device"        : String("iOS")
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
                                
                                /*let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "complete_profile_id")
                                 self.navigationController?.pushViewController(push, animated: true)*/
                                
                                if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                    print(language_select as Any)
                                    
                                    if (language_select == "en") {
                                        
                                        /*let alert = NewYorkAlertController(title: JSON["status"] as? String, message: JSON["msg"] as? String, style: .alert)
                                        let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel)
                                        alert.addButtons([cancel])
                                        self.present(alert, animated: true)*/
                                        
                                        self.view.makeToast(JSON["msg"] as? String)
                                    } else {
                                        
                                        /*let alert = NewYorkAlertController(title: text_language.common_screen(status: "success"), message: JSON["msg_ch"] as? String, style: .alert)
                                        let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel)
                                        alert.addButtons([cancel])
                                        self.present(alert, animated: true)*/
                                        
                                        self.view.makeToast(JSON["msg_ch"] as? String)
                                        
                                    }
                                    
                                }
                                                            
                                
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
                        
                        self.create_an_account()
                        
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
}

//MARK:- TABLE VIEW -
extension update_profile: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:updating_profile_table_cell = tableView.dequeueReusableCell(withIdentifier: "updating_profile_table_cell") as! updating_profile_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        cell.btn_continue.setTitle(text_language.create_an_account_screen(status: "#09"), for: .normal)
        
        // self.convert_language()
        self.lbl_navigation_title.text = text_language.create_an_account_screen(status: "#10")
        
        cell.txt_name.placeholder = text_language.create_an_account_screen(status: "#04")
        cell.txt_email.placeholder = text_language.create_an_account_screen(status: "#05")
        cell.txt_phone.placeholder = text_language.create_an_account_screen(status: "#06")
                
        cell.txt_name.delegate = self
        cell.txt_email.delegate = self
        cell.txt_phone.delegate = self
        
        cell.btn_continue.addTarget(self, action: #selector(continue_click_method2), for: .touchUpInside)
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            cell.txt_name.text = (person["fullName"] as! String)
            cell.txt_email.text = (person["email"] as! String)
            cell.txt_phone.text = (person["contactNumber"] as! String)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 820
    }

}
