//
//  journal_list.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 18/03/24.
//

import UIKit
import Alamofire

class journal_list: UIViewController {

    var arrListOfAppointment:Array<Any>!
    
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
        }
    }
    
    @IBOutlet weak var tble_view:UITableView! {
        didSet {
            tble_view.backgroundColor = .clear
            
            tble_view.separatorColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        self.convert_language()
    }
    
    @objc func convert_language() {
        self.lbl_navigation_title.text = text_language.all_journal_screen(status: "#01")
        
        self.journal_list_WB()
    }
    
    @objc func journal_list_WB() {
        
        self.view.endEditing(true)
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]
                
                let urlString = application_base_url
                var parameters:Dictionary<AnyHashable, Any>!
                
                parameters = [
                    "action"        :   "recordlist",
                    "userId"        :   String(myString),
                ]
                
                print("parameters-------\(String(describing: parameters))")
                
                AF.request(urlString, method: .post, parameters: parameters as? Parameters, headers: headers).responseJSON {
                    response in
                    
                    switch(response.result) {
                    case .success(_):
                        if let data = response.value {
                            
                            let JSON = data as! NSDictionary
                            print(JSON)
                            
                            var strSuccess : String!
                            strSuccess = JSON["status"]as Any as? String
                            
                            var strSuccess2 : String!
                            strSuccess2 = JSON["msg"]as Any as? String
                            
                            if strSuccess == "success" {
                                ERProgressHud.sharedInstance.hide()
                                
                                var ar : NSArray!
                                ar = (JSON["data"] as! Array<Any>) as NSArray
                                
                                self.arrListOfAppointment = (ar as! Array<Any>)
                                
                                self.tble_view.delegate = self
                                self.tble_view.dataSource = self
                                self.tble_view.reloadData()
                                
                                
                                
                                
                                
                                /*if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                    print(language_select as Any)
                                    
                                    if (language_select == "en") {
                                        
                                        self.view.makeToast(String(strSuccess2))
                                        
                                    } else {
                                        
                                        self.view.makeToast(JSON["msg_ch"] as? String)
                                        
                                    }
                                    
                                }*/
                                 
                            } else {
                                //
                                if (strSuccess2 == your_are_not_auth) {
                                    self.generate_token()
                                } else {
                                    ERProgressHud.sharedInstance.hide()
                                    
                                    if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                        print(language_select as Any)
                                        if (language_select == "en") {
                                            
                                            self.view.makeToast(String(strSuccess2))
                                            
                                        } else {
                                            
                                            self.view.makeToast(JSON["msg_ch"] as? String)
                                            
                                        }
                                    }
                                    
                                }
                                
                            }
                        }
                        
                    case .failure(_):
                        print("Error message:\(String(describing: response.error))")
                        ERProgressHud.sharedInstance.hide()
                        
                        
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
                        
                        self.journal_list_WB()
                        
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
extension journal_list: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrListOfAppointment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:journal_list_table_cell = tableView.dequeueReusableCell(withIdentifier: "journal_list_table_cell") as! journal_list_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        let item = self.arrListOfAppointment[indexPath.row] as? [String:Any]
        print(item as Any)
        cell.lbl_title.text = (item!["created"] as! String)+" - Health Journal"
        
        cell.accessoryType = .disclosureIndicator
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = self.arrListOfAppointment[indexPath.row] as? [String:Any]
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "details_id") as? details
        push!.dict_get_all_journal_data = (item! as NSDictionary)
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
