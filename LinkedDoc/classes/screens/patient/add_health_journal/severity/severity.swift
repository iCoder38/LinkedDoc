//
//  severity.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 15/03/24.
//

import UIKit

class severity: UIViewController {

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
    
    @IBOutlet weak var txt_severity:UITextField! {
        didSet {
            txt_severity.layer.cornerRadius = 12
            txt_severity.clipsToBounds = true
            txt_severity.backgroundColor = text_field_BG_color
            txt_severity.placeholder = "Severity"
            txt_severity.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var btn_severity:UIButton!
    
    @IBOutlet weak var btn_continue:UIButton! {
        didSet {
            btn_continue.backgroundColor = button_light_blue_color
            btn_continue.layer.cornerRadius = 12
            btn_continue.clipsToBounds = true
            btn_continue.setTitleColor(.white, for: .normal)
        }
    }
    @IBOutlet weak var btn_skip:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        self.lbl_navigation_title.text = text_language.severity_screen(status: "#01")
        self.lbl_message.text = text_language.severity_screen(status: "#02")
        self.txt_severity.placeholder = text_language.severity_screen(status: "#03")
        
        // get from other's screen
        self.btn_skip.setTitle(text_language.on_set_screen(status: "#04"), for: .normal)
        self.btn_continue.setTitle(text_language.add_health_journal_screen(status: "#06"), for: .normal)
        
        self.btn_severity.addTarget(self, action: #selector(severity_click_method), for: .touchUpInside)
        
        self.btn_skip.addTarget(self, action: #selector(skip_click_method), for: .touchUpInside)
        self.btn_continue.addTarget(self, action: #selector(continue_click_method), for: .touchUpInside)
    }
    
    @objc func severity_click_method() {
        
        let dummyList = [
            "1","2","3","4","5","6","7","8","9","10",
        ]
        
        RPicker.selectOption(title: text_language.severity_screen(status: "#03"), cancelText: text_language.common_screen(status: "dismiss"), dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
            
            if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                print(language_select as Any)
                
                self.txt_severity.text = String(selctedText)
            }
            
        }
    }
    @objc func continue_click_method() {
         
        if (self.txt_severity.text == "") {
            return
        }
        
        let custom_dict = [
            "severity":String(self.txt_severity.text!),
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_severity")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "timinig_id") as? timinig
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    @objc func skip_click_method() {
        let custom_dict = [
            "severity":"",
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_severity")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "timinig_id") as? timinig
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
}
