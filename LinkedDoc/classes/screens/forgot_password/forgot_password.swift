//
//  forgot_password.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 01/04/24.
//

import UIKit
import Alamofire
import Toast_Swift

class forgot_password: UIViewController, UITextFieldDelegate {
    
    var str_back_menu:String!
    
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
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        self.view.backgroundColor = app_bg_color
    }
    
    @objc func change_password_WB() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! forgot_password_table_cell
        
        if (cell.txt_email.text == "") {
            return
        }
        
        
        self.view.endEditing(true)
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "updating"))
        
        let urlString = application_base_url
        var parameters:Dictionary<AnyHashable, Any>!
        
        parameters = [
            "action"        :   "forgotpassword",
            "email"        :   String(cell.txt_email.text!),
        ]
        
        
        print("parameters-------\(String(describing: parameters))")
        
        AF.request(urlString, method: .post, parameters: parameters as? Parameters).responseJSON {
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
                        if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                            print(language_select as Any)
                            
                            if (language_select == "en") {
                                
                                cell.txt_email.text = ""
                                
                                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "forgot_password_otp_id") as? forgot_password_otp
                                push!.str_toast_alert = String(strSuccess2)
                                self.navigationController?.pushViewController(push!, animated: true)
                                
                                
                                
                            } else {
                                
                                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "forgot_password_otp_id") as? forgot_password_otp
                                push!.str_toast_alert = JSON["msg_ch"] as? String
                                self.navigationController?.pushViewController(push!, animated: true)
                                
                                
                                
                            }
                            
                        }
                        
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
                        
                        self.change_password_WB()
                        
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}

//MARK:- TABLE VIEW -
extension forgot_password: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:forgot_password_table_cell = tableView.dequeueReusableCell(withIdentifier: "forgot_password_table_cell") as! forgot_password_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        cell.txt_email.delegate = self
        
        
        cell.txt_email.becomeFirstResponder()
        
        self.lbl_navigation_title.text = text_language.common_screen(status: "forgot_password")
        
        cell.txt_email.placeholder = text_language.login_screen(status: "#04")
        
        cell.btn_submit.setTitle(text_language.add_health_journal_screen(status: "#06"), for: .normal)
        cell.btn_submit.addTarget(self, action: #selector(change_password_WB), for: .touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 900
    }

}
