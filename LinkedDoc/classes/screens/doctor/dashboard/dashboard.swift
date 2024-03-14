//
//  dashboard.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 12/03/24.
//

import UIKit
import SDWebImage

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
    
    @IBOutlet weak var img_profile:UIImageView! {
        didSet {
            // img_profile.layer.cornerRadius = 70
            // img_profile.clipsToBounds = true
            img_profile.layer.masksToBounds = true
            img_profile.layer.borderWidth = 1.5
            img_profile.layer.borderColor = UIColor.white.cgColor
            img_profile.layer.cornerRadius = img_profile.bounds.width / 2
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.sideBarMenu(button: self.btn_back)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(translate_tap))
        self.img_translate.isUserInteractionEnabled = true
        self.img_translate.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(password_tap))
        self.img_password.isUserInteractionEnabled = true
        self.img_password.addGestureRecognizer(tapGestureRecognizer2)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(help_tap))
        self.img_help.isUserInteractionEnabled = true
        self.img_help.addGestureRecognizer(tapGestureRecognizer3)
        
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
            
            self.img_profile.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
            self.img_profile.sd_setImage(with: URL(string: (person["image"] as! String)), placeholderImage: UIImage(named: "avatar"))
            
            self.lbl_name.text = (person["fullName"] as! String)
            self.lbl_phone.text = (person["contactNumber"] as! String)
            self.lbl_address.text =  (person["address"] as! String)
        }
    }
    
    @objc func translate_tap() {
         print("translate")
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "translate_language_id") as? translate_language
        push!.str_back_menu = "back"
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func password_tap() {
        print("password")
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "change_password_id") as? change_password
        push!.str_back_menu = "back"
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func help_tap() {
        print("help")
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "help_id") as? help
        push!.str_back_menu = "back"
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    
    
}
