//
//  update_select_language.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 12/03/24.
//

import UIKit

class update_select_language: UIViewController {
    
    @IBOutlet weak var view_navigation:UIView! {
        didSet {
            view_navigation.backgroundColor = navigation_color
        }
    }
    
    @IBOutlet weak var lbl_navigation_title:UILabel! {
        didSet {
             
        }
    }
    
    @IBOutlet weak var btn_back:UIButton! {
        didSet {
            btn_back.tintColor = .white
            btn_back.setImage(UIImage(systemName: "list.dash"), for: .normal)
        }
    }
    
    @IBOutlet weak var view_mid:UIView! {
        didSet {
            view_mid.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var view_eng:UIView! {
        didSet {
            view_eng.layer.cornerRadius = 12
            view_eng.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var view_chinese:UIView!  {
        didSet {
            view_chinese.layer.cornerRadius = 12
            view_chinese.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var view_spanish:UIView!  {
        didSet {
            view_spanish.layer.cornerRadius = 12
            view_spanish.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var lbl_mid_text:UILabel! {
        didSet {
            lbl_mid_text.text = "select the language to \ncontinue"
            lbl_mid_text.textAlignment = .center
        }
    }
    
    @IBOutlet weak var btn_english:UIButton! {
        didSet {
            self.btn_english.setImage(UIImage(named: "check"), for: .normal)
        }
    }
    @IBOutlet weak var btn_chinese:UIButton!  {
        didSet {

        }
    }
    
    @IBOutlet weak var btn_continue:UIButton!  {
        didSet {
            btn_continue.backgroundColor = button_dark_blue_color
            btn_continue.layer.cornerRadius = 12
            btn_continue.clipsToBounds = true
            btn_continue.setTitleColor(.white, for: .normal)
            btn_continue.isHidden = true
        }
    }
    
    @IBOutlet weak var btn_spanish:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UserDefaults.standard.set("en", forKey: default_key_language)
        if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
            print(language_select as Any)
            
            if (language_select == "en") {
                
                UserDefaults.standard.set("en", forKey: default_key_language)
                
                self.btn_english.setImage(UIImage(named: "check"), for: .normal)
                self.btn_chinese.setImage(UIImage(named: "un_check"), for: .normal)
                self.btn_spanish.setImage(UIImage(named: "un_check"), for: .normal)
                
                self.lbl_navigation_title.text = navigation_title_select_language_en
                self.lbl_mid_text.text = select_language_text_en
                self.btn_continue.setTitle(button_text_continue_en, for: .normal)
                
            } else if (language_select == "ch") {
                
                UserDefaults.standard.set("ch", forKey: default_key_language)
                
                self.btn_english.setImage(UIImage(named: "un_check"), for: .normal)
                self.btn_chinese.setImage(UIImage(named: "check"), for: .normal)
                self.btn_spanish.setImage(UIImage(named: "un_check"), for: .normal)
                
                self.lbl_navigation_title.text = navigation_title_select_language_ch
                self.lbl_mid_text.text = select_language_text_ch
                self.btn_continue.setTitle(button_text_continue_ch, for: .normal)
                
            } else {
                UserDefaults.standard.set("sp", forKey: default_key_language)
                
                self.btn_english.setImage(UIImage(named: "un_check"), for: .normal)
                self.btn_chinese.setImage(UIImage(named: "un_check"), for: .normal)
                self.btn_spanish.setImage(UIImage(named: "check"), for: .normal)
                
                self.lbl_navigation_title.text = navigation_title_select_language_sp
                self.lbl_mid_text.text = select_language_text_sp
                self.btn_continue.setTitle(button_text_continue_sp, for: .normal)
            }
        }
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.sideBarMenu(button: self.btn_back)
        
        self.btn_english.addTarget(self, action: #selector(english_click_method), for: .touchUpInside)
        self.btn_chinese.addTarget(self, action: #selector(chinese_click_method), for: .touchUpInside)
        self.btn_spanish.addTarget(self, action: #selector(spanish_click_method), for: .touchUpInside)
        
        self.btn_continue.addTarget(self, action: #selector(continue_click_method), for: .touchUpInside)
        
        self.view.backgroundColor = app_bg_color
    }
    
    @objc func sideBarMenu() {
        
        if revealViewController() != nil {
            btn_back.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            
            revealViewController().rearViewRevealWidth = 300
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    @objc func english_click_method() {
        Utils.medium_vibrate()
        
        UserDefaults.standard.set("en", forKey: default_key_language)
        
        self.btn_english.setImage(UIImage(named: "check"), for: .normal)
        self.btn_chinese.setImage(UIImage(named: "un_check"), for: .normal)
        self.btn_spanish.setImage(UIImage(named: "un_check"), for: .normal)
        
        self.lbl_navigation_title.text = navigation_title_select_language_en
        self.lbl_mid_text.text = select_language_text_en
        self.btn_continue.setTitle(button_text_continue_en, for: .normal)
    }
    
    @objc func chinese_click_method() {
        Utils.medium_vibrate()
        
        UserDefaults.standard.set("ch", forKey: default_key_language)
        
        self.btn_english.setImage(UIImage(named: "un_check"), for: .normal)
        self.btn_chinese.setImage(UIImage(named: "check"), for: .normal)
        self.btn_spanish.setImage(UIImage(named: "un_check"), for: .normal)
        
        self.lbl_navigation_title.text = navigation_title_select_language_ch
        self.lbl_mid_text.text = select_language_text_ch
        self.btn_continue.setTitle(button_text_continue_ch, for: .normal)
    }
    
    @objc func spanish_click_method() {
        Utils.medium_vibrate()
        
        UserDefaults.standard.set("sp", forKey: default_key_language)
        
        self.btn_english.setImage(UIImage(named: "un_check"), for: .normal)
        self.btn_chinese.setImage(UIImage(named: "un_check"), for: .normal)
        self.btn_spanish.setImage(UIImage(named: "check"), for: .normal)
        
        self.lbl_navigation_title.text = navigation_title_select_language_sp
        self.lbl_mid_text.text = select_language_text_sp
        self.btn_continue.setTitle(button_text_continue_sp, for: .normal)
    }
    
    @objc func continue_click_method() {
        Utils.light_vibrate()
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginViewController_id")
        self.navigationController?.pushViewController(push, animated: true)
    }
}

