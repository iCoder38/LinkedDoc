//
//  patient_dashboard.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 14/03/24.
//

import UIKit
import SDWebImage
import CoreLocation

class patient_dashboard: UIViewController, CLLocationManagerDelegate {
    
    var str_location_access:String! = "0"
    
    let locationManager = CLLocationManager()
    
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
    
    @IBOutlet weak var view_journal:UIView! {
        didSet {
            view_journal.layer.cornerRadius = 12
            view_journal.clipsToBounds = true
            view_journal.backgroundColor = button_BG_color
        }
    }
    
    @IBOutlet weak var view_search_doctor:UIView! {
        didSet {
            view_search_doctor.layer.cornerRadius = 12
            view_search_doctor.clipsToBounds = true
            view_search_doctor.backgroundColor = button_BG_color
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
    
    @IBOutlet weak var view_add_journal:UIView! {
        didSet {
            view_add_journal.layer.cornerRadius = 12
            view_add_journal.clipsToBounds = true
            view_add_journal.backgroundColor = button_BG_color
        }
    }
    @IBOutlet weak var img_translate:UIImageView!
    @IBOutlet weak var img_password:UIImageView!
    @IBOutlet weak var img_help:UIImageView!
    @IBOutlet weak var img_add_journal:UIImageView!
    
    @IBOutlet weak var lbl_translate:UILabel!
    @IBOutlet weak var lbl_password:UILabel!
    @IBOutlet weak var lbl_help:UILabel!
    @IBOutlet weak var img_logout:UIImageView!
    @IBOutlet weak var img_journal:UIImageView!
    @IBOutlet weak var img_doctors:UIImageView!
    
    @IBOutlet weak var lbl_add_journal:UILabel!
    @IBOutlet weak var lbl_journal:UILabel!
    @IBOutlet weak var lbl_search_doctor:UILabel!
    @IBOutlet weak var lbl_logout:UILabel!
    
    @IBOutlet weak var lbl_name:UILabel!
    @IBOutlet weak var lbl_phone:UILabel!
    @IBOutlet weak var lbl_address:UILabel!
    
    var strSaveLatitude:String!
    var strSaveLongitude:String!
    
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
        
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(add_journal_tap))
        self.img_add_journal.isUserInteractionEnabled = true
        self.img_add_journal.addGestureRecognizer(tapGestureRecognizer4)
        
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(journal_list_tap))
        self.img_journal.isUserInteractionEnabled = true
        self.img_journal.addGestureRecognizer(tapGestureRecognizer5)
        
        let tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(logout_tap))
        self.img_logout.isUserInteractionEnabled = true
        self.img_logout.addGestureRecognizer(tapGestureRecognizer6)
        
        let tapGestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(doctors_tap))
        self.img_doctors.isUserInteractionEnabled = true
        self.img_doctors.addGestureRecognizer(tapGestureRecognizer7)
        
        self.convert_language()
        
        self.check_location_is_enable_or_not()
        
    }
    
    
    @objc func check_location_is_enable_or_not() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
                self.strSaveLatitude = "0"
                self.strSaveLongitude = "0"
                self.str_location_access = "0"
                
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                self.str_location_access = "1"
                
            @unknown default:
                break
            }
        }
    }
    
    @objc func convert_language() {
        self.lbl_navigation_title.text = text_language.dashboard_screen(status: "#01")
        
        self.lbl_translate.text = text_language.dashboard_screen(status: "#02")
        self.lbl_help.text = text_language.dashboard_screen(status: "#04")
        
        self.lbl_journal.text = text_language.dashboard_screen(status: "#05")
        self.lbl_search_doctor.text = text_language.dashboard_screen(status: "#06")
        self.lbl_add_journal.text = text_language.dashboard_screen(status: "#07")
        self.lbl_logout.text = text_language.dashboard_screen(status: "#08")
        
        
        
        
        
        
        
        
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
//        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "change_password_id") as? change_password
//        push!.str_back_menu = "back"
//        self.navigationController?.pushViewController(push!, animated: true)
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "help_id") as? help
        push!.str_back_menu = "back"
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func help_tap() {
        print("help")
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "help_id") as? help
        push!.str_back_menu = "back"
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func logout_tap() {
        print("logout")
        logout_click_method()
    }
    
    @objc func add_journal_tap() {
        print("add journal")
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "add_health_journal_id") as? add_health_journal
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func journal_list_tap() {
        print("all journal")
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "journal_list_id") as? journal_list
        self.navigationController?.pushViewController(push!, animated: true)
    }
    
    @objc func doctors_tap() {
        print("doctors tab")
        
            let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "nearby_doctors_id") as? nearby_doctors
            self.navigationController?.pushViewController(push!, animated: true)
        
        
    }
    
}
