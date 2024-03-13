//
//  welcome.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 12/03/24.
//

import UIKit

class welcome: UIViewController {
    
    
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
    
    @IBOutlet weak var btn_doctor:UIButton!  {
        didSet {
            btn_doctor.backgroundColor = button_dark_blue_color
            btn_doctor.layer.cornerRadius = 12
            btn_doctor.clipsToBounds = true
            btn_doctor.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBOutlet weak var btn_patient:UIButton!  {
        didSet {
            btn_patient.backgroundColor = button_light_blue_color
            btn_patient.layer.cornerRadius = 12
            btn_patient.clipsToBounds = true
            btn_patient.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBOutlet weak var lbl_message:UILabel! {
        didSet {
            lbl_message.textColor = .black
        }
    }
    
    @IBOutlet weak var img_profile:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_doctor.addTarget(self, action: #selector(doctor_click_method), for: .touchUpInside)
        self.btn_patient.addTarget(self, action: #selector(patient_click_method), for: .touchUpInside)
        
        self.convert_language()
    }
    
    @objc func convert_language() {
        // print(text_language.selected_language_get())
     
        self.lbl_navigation_title.text = text_language.welcome_screen(status: "#01")
        self.lbl_message.text = text_language.welcome_screen(status: "#02")
        self.btn_doctor.setTitle(text_language.welcome_screen(status: "#03"), for: .normal)
        self.btn_patient.setTitle(text_language.welcome_screen(status: "#04"), for: .normal)
        self.lbl_message.text = text_language.welcome_screen(status: "#05")
        
    }
    
    @objc func doctor_click_method() {
        Utils.light_vibrate()
        
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "loginViewController_id")
        self.navigationController?.pushViewController(push, animated: true)
    }
    
    @objc func patient_click_method() {
        Utils.light_vibrate()
        
    }
    
     
}

