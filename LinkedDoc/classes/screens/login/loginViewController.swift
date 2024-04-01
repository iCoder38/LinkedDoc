//
//  loginViewController.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit
import Alamofire

class loginViewController: UIViewController, UITextFieldDelegate {

    var str_profile:String!
    
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
    
    @IBOutlet weak var lbl_message:UILabel! {
        didSet {
            lbl_message.textColor = .black
        }
    }
    
    @IBOutlet weak var img_profile:UIImageView!
    
    @IBOutlet weak var txt_email:UITextField! {
        didSet {
            txt_email.layer.cornerRadius = 12
            txt_email.clipsToBounds = true
            txt_email.backgroundColor = text_field_BG_color
            txt_email.placeholder = "Email"
            txt_email.setLeftPaddingPoints(20)
            txt_email.keyboardType = .emailAddress
        }
    }
    
    
    @IBOutlet weak var txt_password:UITextField! {
        didSet {
            txt_password.layer.cornerRadius = 12
            txt_password.clipsToBounds = true
            txt_password.backgroundColor = text_field_BG_color
            txt_password.placeholder = "Password"
            txt_password.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var view_bottom:UIView! {
        didSet {
            view_bottom.layer.cornerRadius = 12
            view_bottom.clipsToBounds = true
            view_bottom.backgroundColor = .white
        }
    }
    @IBOutlet weak var btn_continue:UIButton! {
        didSet {
            btn_continue.backgroundColor = button_light_blue_color
            btn_continue.layer.cornerRadius = 12
            btn_continue.clipsToBounds = true
            btn_continue.setTitleColor(.white, for: .normal)
        }
    }
    @IBOutlet weak var btn_forgot_password:UIButton! {
        didSet {
            btn_forgot_password.layer.cornerRadius = 12
            btn_forgot_password.clipsToBounds = true
        }
    }
    @IBOutlet weak var btn_register_now:UIButton! {
        didSet {
            btn_register_now.layer.cornerRadius = 12
            btn_register_now.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        // keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.txt_email.delegate = self
        self.txt_password.delegate = self
        
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        self.btn_forgot_password.addTarget(self, action: #selector(forgot_password_click_method), for: .touchUpInside)
        
        self.view.backgroundColor = app_bg_color
        self.convert_language()
    }
    
    @objc func convert_language() {
        // print(text_language.selected_language_get())
     
        self.lbl_navigation_title.text = text_language.login_screen(status: "#01")
        self.lbl_message.text = text_language.login_screen(status: "#02")
        
        self.btn_continue.setTitle(text_language.login_screen(status: "#01"), for: .normal)
        
        self.txt_email.placeholder = text_language.login_screen(status: "#04")
        self.txt_password.placeholder = text_language.login_screen(status: "#05")
        
        self.btn_register_now.setTitle(text_language.login_screen(status: "#06"), for: .normal)
        
        self.btn_register_now.addTarget(self, action: #selector(register_now_click_method), for: .touchUpInside)
        self.btn_continue.addTarget(self, action: #selector(login_click_method_WB), for: .touchUpInside)
    }
    
    @objc func doctor_click_method() {
        Utils.light_vibrate()
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "create_an_account_id") as? create_an_account
        push!.str_get_profile = String(self.str_profile)
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func forgot_password_click_method() {
        Utils.light_vibrate()
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "forgot_password_id") as? forgot_password
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func patient_click_method() {
        Utils.light_vibrate()
        
    }
    
    @objc func register_now_click_method() {
        Utils.light_vibrate()
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "create_an_account_id") as? create_an_account
        push!.str_get_profile = String(self.str_profile)
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func login_click_method_WB() {
        
        if (self.txt_email.text == "") {
            return
        }
        
        if (self.txt_password.text == "") {
            return
        }
        
        self.view.endEditing(true)
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
        var parameters:Dictionary<AnyHashable, Any>!
        
        
        parameters = [
            "action"    : "login",
            "email"     : String(self.txt_email.text!),
            "password"  : String(self.txt_password.text!),
            "device"    : "iOS",
            
        ]
        
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
                        ERProgressHud.sharedInstance.hide()
                        
                        var dict: Dictionary<AnyHashable, Any>
                        dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                        
                        let defaults = UserDefaults.standard
                        defaults.setValue(dict, forKey: str_save_login_user_data)
                        
                        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
                            print(person as Any)
                            
                            if person["role"] as! String == "Doctor" {
                                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dashboard_id")
                                self.navigationController?.pushViewController(push, animated: true)
                            } else {
                                let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "patient_dashboard_id")
                                self.navigationController?.pushViewController(push, animated: true)
                            }
                            
                        }
                        
                    } else {
                        ERProgressHud.sharedInstance.hide()
                        
                        if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                            print(language_select as Any)
                            
                            if (language_select == "en") {
                                self.view.makeToast(JSON["msg"] as? String)
                            } else {
                                self.view.makeToast(JSON["msg_ch"] as? String)
                            }
                            
                        }
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
