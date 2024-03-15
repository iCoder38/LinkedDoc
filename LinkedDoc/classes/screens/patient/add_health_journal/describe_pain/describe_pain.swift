//
//  describe_pain.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 14/03/24.
//

import UIKit

class describe_pain: UIViewController {

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
    
    @IBOutlet weak var lbl_message:UILabel!
    
    @IBOutlet weak var btn_continue:UIButton! {
        didSet {
            btn_continue.backgroundColor = button_light_blue_color
            btn_continue.layer.cornerRadius = 12
            btn_continue.clipsToBounds = true
            btn_continue.setTitleColor(.white, for: .normal)
        }
    }
    @IBOutlet weak var btn_skip:UIButton!
    
    var str_server_value_for_dull:String!
    var str_server_value_for_constant:String!
    
    @IBOutlet weak var txt_dull:UITextField! {
        didSet {
            txt_dull.layer.cornerRadius = 12
            txt_dull.clipsToBounds = true
            txt_dull.backgroundColor = text_field_BG_color
            txt_dull.placeholder = "Dull"
            txt_dull.setLeftPaddingPoints(20)
            txt_dull.keyboardType = .numberPad
        }
    }
    @IBOutlet weak var txt_constant:UITextField! {
        didSet {
            txt_constant.layer.cornerRadius = 12
            txt_constant.clipsToBounds = true
            txt_constant.backgroundColor = text_field_BG_color
            txt_constant.placeholder = "Constant"
            txt_constant.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var btn_dull:UIButton!
    @IBOutlet weak var btn_constant:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        self.convert_language()
    }
    
    @objc func convert_language() {
        self.lbl_navigation_title.text = text_language.quality_screen(status: "#01")
        
        self.lbl_message.text = text_language.quality_screen(status: "#02")
        
        self.txt_dull.placeholder = text_language.quality_screen(status: "#03")
        self.txt_constant.placeholder = text_language.quality_screen(status: "#04")
        
        // get from other's screen
        self.btn_skip.setTitle(text_language.on_set_screen(status: "#04"), for: .normal)
        self.btn_continue.setTitle(text_language.add_health_journal_screen(status: "#06"), for: .normal)
        
        self.btn_dull.addTarget(self, action: #selector(dull_click_method), for: .touchUpInside)
        self.btn_constant.addTarget(self, action: #selector(constant_click_method), for: .touchUpInside)
        
        self.btn_skip.addTarget(self, action: #selector(skip_click_method), for: .touchUpInside)
        self.btn_continue.addTarget(self, action: #selector(continue_click_method), for: .touchUpInside)
    }
    
    @objc func continue_click_method() {
         
        if (self.txt_dull.text == "") {
            return
        }
        if (self.txt_constant.text == "") {
            return
        }
        
        let custom_dict = [
            "dull":String(self.txt_dull.text!),
            "constant":String(self.txt_constant.text!),
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_quality")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "region_id") as? region
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    @objc func dull_click_method() {
        
        let dummyList = [
            text_language.common_screen(status: "dull_option_dull"),
            text_language.common_screen(status: "dull_option_sharp"),
            text_language.common_screen(status: "dull_option_pressure"),
            text_language.common_screen(status: "dull_option_throbing"),
            text_language.common_screen(status: "dull_option_burning"),
            text_language.common_screen(status: "dull_option_other")
        ]
        
        RPicker.selectOption(title: text_language.quality_screen(status: "#03"), cancelText: text_language.common_screen(status: "dismiss"), dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
             
            if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                print(language_select as Any)
                
                if (language_select == "en") {
                    self.txt_dull.text = String(selctedText)
                    self.str_server_value_for_dull = String(selctedText)
                } else {
                    if String(selctedText) == "身體沒反應" { // dull
                        self.str_server_value_for_dull = "Dull"
                    } else if String(selctedText) == "身體劇痛" { // sharp
                        self.str_server_value_for_dull = "Sharp"
                    } else if String(selctedText) == "身體壓力指數" { // "Pressure"
                        self.str_server_value_for_dull = "Pressure"
                    } else if String(selctedText) == "身體悸動" { // "Throbing"
                        self.str_server_value_for_dull = "Throbing"
                    } else if String(selctedText) == "身體灼熱" { // burning
                        self.str_server_value_for_dull = "Burning"
                    } else { // other
                        self.str_server_value_for_dull = "Other"
                    }
                    self.txt_dull.text = String(selctedText)
                }
            }
            print(self.str_server_value_for_dull as Any)
        }
    }
    
    @objc func constant_click_method() {
        
        let dummyList = [
            text_language.common_screen(status: "constant_option_constant"),
            text_language.common_screen(status: "constant_option_intermittent"),
            text_language.common_screen(status: "constant_option_other")
        ]
        
        RPicker.selectOption(title: text_language.quality_screen(status: "#04"), cancelText: text_language.common_screen(status: "dismiss"), dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
             
            if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                print(language_select as Any)
                
                if (language_select == "en") {
                    self.txt_constant.text = String(selctedText)
                    self.str_server_value_for_constant = String(selctedText)
                } else {
                    if String(selctedText) == "持續" { //
                        self.str_server_value_for_constant = "Constant"
                    } else if String(selctedText) == "間歇性" { //
                        self.str_server_value_for_constant = "Intermittent"
                    } else { // other
                        self.str_server_value_for_constant = "Other"
                    }
                    self.txt_constant.text = String(selctedText)
                }
            }
            print(self.str_server_value_for_constant as Any)
        }
    }
    
    @objc func skip_click_method() {
        let custom_dict = [
            "dull":"",
            "constant":"",
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_quality")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "region_id") as? region
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
}
