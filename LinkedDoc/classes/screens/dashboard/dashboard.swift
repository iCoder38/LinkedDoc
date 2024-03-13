//
//  dashboard.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 12/03/24.
//

import UIKit

class dashboard: UIViewController {

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
    
    @IBOutlet weak var view_translate:UIView! {
        didSet {
            view_translate.layer.cornerRadius = 12
            view_translate.clipsToBounds = true
            view_translate.backgroundColor = button_BG_color
        }
    }
    
    @IBOutlet weak var view_password:UIView! {
        didSet {
            view_password.layer.cornerRadius = 12
            view_password.clipsToBounds = true
            view_password.backgroundColor = button_BG_color
        }
    }
    
    @IBOutlet weak var view_hep:UIView! {
        didSet {
            view_hep.layer.cornerRadius = 12
            view_hep.clipsToBounds = true
            view_hep.backgroundColor = button_BG_color
        }
    }
    
    @IBOutlet weak var img_translate:UIImageView!
    @IBOutlet weak var img_password:UIImageView!
    @IBOutlet weak var img_help:UIImageView!
    
    @IBOutlet weak var lbl_translate:UILabel!
    @IBOutlet weak var lbl_password:UILabel!
    @IBOutlet weak var lbl_help:UILabel!
    
    @IBOutlet weak var lbl_name:UILabel!
    @IBOutlet weak var lbl_phone:UILabel!
    @IBOutlet weak var lbl_address:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sideBarMenu(button: self.btn_back)
        self.convert_language()
    }
    
    @objc func convert_language() {
        self.lbl_navigation_title.text = text_language.dashboard_screen(status: "#01")
        
        self.lbl_translate.text = text_language.dashboard_screen(status: "#02")
        self.lbl_password.text = text_language.dashboard_screen(status: "#03")
        self.lbl_help.text = text_language.dashboard_screen(status: "#04")
        
        self.parse_server_value()
    }
    
    @objc func parse_server_value() {
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            self.lbl_name.text = (person["fullName"] as! String)
            // self.lbl_phone.text =  // (person[""] as! String)
            self.lbl_address.text =  (person["address"] as! String)
        }
    }
   
    
}
