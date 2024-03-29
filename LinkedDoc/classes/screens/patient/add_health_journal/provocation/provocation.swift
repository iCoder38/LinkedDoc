//
//  provocation.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 14/03/24.
//

import UIKit

class provocation: UIViewController {
    
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
    @IBOutlet weak var txt_view_text:UILabel!
    @IBOutlet weak var txt_view:UITextView!{
        didSet {
            txt_view.backgroundColor = text_field_BG_color
            txt_view.layer.cornerRadius = 12
            txt_view.clipsToBounds = true
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
    @IBOutlet weak var btn_skip:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        self.convert_language()
    }
    
    @objc func convert_language() {
        self.lbl_navigation_title.text = text_language.provocation_screen(status: "#01")
        
        self.lbl_message.text = text_language.provocation_screen(status: "#02")
        
        // get from other's screen
        self.txt_view_text.text = text_language.on_set_screen(status: "#02")
        self.btn_skip.setTitle(text_language.on_set_screen(status: "#04"), for: .normal)
        self.btn_continue.setTitle(text_language.add_health_journal_screen(status: "#06"), for: .normal)
        
        self.btn_skip.addTarget(self, action: #selector(skip_click_method), for: .touchUpInside)
        self.btn_continue.addTarget(self, action: #selector(continue_click_method), for: .touchUpInside)
    }
    @objc func continue_click_method() {
         
        if (self.txt_view.text == "") {
            return
        }
        
        let custom_dict = [
            "provocation":String(self.txt_view.text!),
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_provocation")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "describe_pain_id") as? describe_pain
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    @objc func skip_click_method() {
        let custom_dict = [
            "provocation":"",
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_provocation")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "describe_pain_id") as? describe_pain
        self.navigationController?.pushViewController(push!, animated: true)
    }
}
