//
//  help.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 13/03/24.
//

import UIKit
import Alamofire
import MessageUI

class help: UIViewController, MFMailComposeViewControllerDelegate {

    var str_back_menu:String!
    
    var phone:String!
    var email:String!
    
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
    
    @IBOutlet weak var btn_connect_with_us:UIButton!
    @IBOutlet weak var btn_whatsapp:UIButton!
    @IBOutlet weak var btn_support:UIButton!
    @IBOutlet weak var btn_email:UIButton!
    
    @IBOutlet weak var btn_all_rights:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = text_field_BG_color
        
        if (self.str_back_menu == "back") {
            self.btn_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        } else {
            self.btn_back.setImage(UIImage(systemName: "list.dash"), for: .normal)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.sideBarMenu(button: self.btn_back)
        }
        self.convert_language()
    }
    
    @objc func convert_language() {
        self.lbl_navigation_title.text = text_language.help_screen(status: "#01")
        
        self.btn_whatsapp.setTitle(text_language.help_screen(status: "#03"), for: .normal)
        self.btn_connect_with_us.setTitle(text_language.help_screen(status: "#02"), for: .normal)
        
        self.btn_all_rights.setTitle(text_language.help_screen(status: "#05"), for: .normal)
        
        self.btn_email.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
        
        self.help_WB()
    }
    
    @objc func help_WB() {
        
        self.view.endEditing(true)
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
        
       
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]
                
                let urlString = application_base_url
                var parameters:Dictionary<AnyHashable, Any>!
                
                parameters = [
                    "action"        :   "help",
                    
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
                                
                                var dict: Dictionary<AnyHashable, Any>
                                dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                                
                                var merge_support:String!
                                var merge_email:String!
                                
                                merge_support = text_language.help_screen(status: "#04")+": "+String(dict["phone"] as! String)
                                merge_email = text_language.login_screen(status: "#04")+": "+String(dict["eamil"] as! String)
                                
                                self.phone = String(dict["phone"] as! String)
                                self.email = String(dict["eamil"] as! String)
                                
                                self.btn_support.setTitle(merge_support, for: .normal)
                                self.btn_email.setTitle(merge_email, for: .normal)
                                
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
                        
                        self.help_WB()
                        
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
    
    @objc func sendEmail() {
        let mailComposeViewController = configureMailComposer()
            if MFMailComposeViewController.canSendMail(){
                self.present(mailComposeViewController, animated: true, completion: nil)
            }else{
                print("Can't send email")
            }
    }

    func configureMailComposer() -> MFMailComposeViewController{
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients([self.email])
        mailComposeVC.setSubject("")
        mailComposeVC.setMessageBody("", isHTML: false)
        return mailComposeVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
}
