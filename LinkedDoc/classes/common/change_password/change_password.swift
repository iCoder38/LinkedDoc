//
//  change_password.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 12/03/24.
//

import UIKit
import Alamofire
import Toast_Swift

class change_password: UIViewController {

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
        
        if (self.str_back_menu == "back") {
            self.btn_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        } else {
            self.btn_back.setImage(UIImage(systemName: "list.dash"), for: .normal)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.sideBarMenu(button: self.btn_back)
        }
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        self.view.backgroundColor = app_bg_color
    }
    
    @objc func change_password_WB() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! change_password_table_cell
        
        if (cell.txt_old_password.text == "") {
            return
        }
        if (cell.txt_new_password.text == "") {
            return
        }
        if (cell.txt_confirm_password.text == "") {
            return
        }
        if (cell.txt_new_password.text != cell.txt_confirm_password.text) {
            return
        }
        
        self.view.endEditing(true)
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "updating"))
        
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
                    "action"        :   "changePassword",
                    "userId"        :   String(myString),
                    "oldPassword"   :   String(cell.txt_old_password.text!),
                    "newPassword"   :   String(cell.txt_new_password.text!)
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
                                if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                    print(language_select as Any)
                                    
                                    if (language_select == "en") {
                                        
                                        cell.txt_old_password.text = ""
                                        cell.txt_new_password.text = ""
                                        cell.txt_confirm_password.text = ""
                                        
                                        self.view.makeToast(String(strSuccess2))
                                        
                                    } else {
                                        
                                        /*let alert = NewYorkAlertController(title: text_language.common_screen(status: "success"), message: JSON["msg_ch"] as? String, style: .alert)
                                         let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel)
                                         alert.addButtons([cancel])
                                         self.present(alert, animated: true)*/
                                        
                                        self.view.makeToast(JSON["msg_ch"] as? String)
                                        
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
extension change_password: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:change_password_table_cell = tableView.dequeueReusableCell(withIdentifier: "change_password_table_cell") as! change_password_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        self.lbl_navigation_title.text = text_language.change_password_screen(status: "#01")
        
        cell.txt_old_password.placeholder = text_language.change_password_screen(status: "#02")
        cell.txt_new_password.placeholder = text_language.change_password_screen(status: "#03")
        cell.txt_confirm_password.placeholder = text_language.change_password_screen(status: "#04")
        
        cell.btn_change_password.setTitle(text_language.change_password_screen(status: "#05"), for: .normal)
        
        cell.btn_change_password.addTarget(self, action: #selector(change_password_WB), for: .touchUpInside)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 900
    }

}
