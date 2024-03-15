//
//  timinig.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 15/03/24.
//

import UIKit

class timinig: UIViewController {

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
    @IBOutlet weak var lbl_pd1:UILabel!
    
    @IBOutlet weak var btn_continue:UIButton! {
        didSet {
            btn_continue.backgroundColor = button_light_blue_color
            btn_continue.layer.cornerRadius = 12
            btn_continue.clipsToBounds = true
            btn_continue.setTitleColor(.white, for: .normal)
        }
    }
    @IBOutlet weak var btn_skip:UIButton!
    
    @IBOutlet weak var txt_view:UITextView!{
        didSet {
            txt_view.backgroundColor = text_field_BG_color
            txt_view.layer.cornerRadius = 12
            txt_view.clipsToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        self.lbl_navigation_title.text = text_language.timings_screen(status: "#01")
        self.lbl_message.text = text_language.timings_screen(status: "#02")
        
        self.lbl_pd1.text = text_language.common_screen(status: "please_describe")
        
        // get from other's screen
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
            "timing":String(self.txt_view.text!),
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_timing")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "actions_id") as? actions
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    @objc func skip_click_method() {
        let custom_dict = [
            "timing":"",
        ]
        print(custom_dict as Any)
          
        let defaults = UserDefaults.standard
        defaults.setValue(custom_dict, forKey: "key_save_timing")
             
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "actions_id") as? actions
        self.navigationController?.pushViewController(push!, animated: true)
    }
}
