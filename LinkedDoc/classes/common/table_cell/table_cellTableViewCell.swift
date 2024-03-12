//
//  table_cellTableViewCell.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit

class table_cell: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// /* ************** CREATE AN ACCOUNT ************************ */
// /* ********************************************************** */
class create_an_account_table_cell : UITableViewCell {
    
    @IBOutlet weak var view_under_image:UIView! {
        didSet {
            view_under_image.layer.cornerRadius = 8
            view_under_image.clipsToBounds = true
            view_under_image.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var txt_name:UITextField! {
        didSet {
            txt_name.layer.cornerRadius = 12
            txt_name.clipsToBounds = true
            txt_name.backgroundColor = text_field_BG_color
            txt_name.placeholder = "name"
            txt_name.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_email:UITextField! {
        didSet {
            txt_email.layer.cornerRadius = 12
            txt_email.clipsToBounds = true
            txt_email.backgroundColor = text_field_BG_color
            txt_email.placeholder = "Email address"
            txt_email.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_phone:UITextField! {
        didSet {
            txt_phone.layer.cornerRadius = 12
            txt_phone.clipsToBounds = true
            txt_phone.backgroundColor = text_field_BG_color
            txt_phone.placeholder = "Phone"
            txt_phone.setLeftPaddingPoints(20)
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
    
    @IBOutlet weak var lbl_create_account_text:UILabel!
    @IBOutlet weak var lbl_already_have_an_account:UILabel!
    
    @IBOutlet weak var btn_continue:UIButton!  {
        didSet {
            btn_continue.backgroundColor = button_light_blue_color
            btn_continue.layer.cornerRadius = 12
            btn_continue.clipsToBounds = true
            btn_continue.setTitleColor(.white, for: .normal)
        }
    }
    
}
// /* ************** COMPLETE PROFILE ************************ */
// /* ********************************************************** */
class complete_profile_table_cell : UITableViewCell {
    
    @IBOutlet weak var view_tble_view:UIView! {
        didSet {
            view_tble_view.layer.cornerRadius = 8
            view_tble_view.clipsToBounds = true
            view_tble_view.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var txt_complete_address:UITextField! {
        didSet {
            txt_complete_address.layer.cornerRadius = 12
            txt_complete_address.clipsToBounds = true
            txt_complete_address.backgroundColor = .white
            txt_complete_address.placeholder = "Complete address"
            txt_complete_address.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var txt_area_zipcode:UITextField! {
        didSet {
            txt_area_zipcode.layer.cornerRadius = 12
            txt_area_zipcode.clipsToBounds = true
            txt_area_zipcode.backgroundColor = .white
            txt_area_zipcode.placeholder = "Area zipcode"
            txt_area_zipcode.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var txt_working_hours:UITextField! {
        didSet {
            txt_working_hours.layer.cornerRadius = 12
            txt_working_hours.clipsToBounds = true
            txt_working_hours.backgroundColor = .white
            txt_working_hours.placeholder = "Working hours"
            txt_working_hours.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var txt_year_of_experience:UITextField! {
        didSet {
            txt_year_of_experience.layer.cornerRadius = 12
            txt_year_of_experience.clipsToBounds = true
            txt_year_of_experience.backgroundColor = .white
            txt_year_of_experience.placeholder = "Year of experience"
            txt_year_of_experience.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var txt_specialization:UITextField! {
        didSet {
            txt_specialization.layer.cornerRadius = 12
            txt_specialization.clipsToBounds = true
            txt_specialization.backgroundColor = .white
            txt_specialization.placeholder = "Specialization"
            txt_specialization.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_view:UITextView! {
        didSet {
            txt_view.layer.cornerRadius = 12
            txt_view.clipsToBounds = true
            txt_view.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var btn_finish:UIButton!  {
        didSet {
            btn_finish.backgroundColor = button_light_blue_color
            btn_finish.layer.cornerRadius = 12
            btn_finish.clipsToBounds = true
            btn_finish.setTitleColor(.white, for: .normal)
        }
    }
    
}

// /* ************** TRANSLATE LANGUAGE ************************ */
// /* ********************************************************** */
class translate_language_table_cell : UITableViewCell {
    
    @IBOutlet weak var txt_view_up:UITextView! {
        didSet {
            txt_view_up.layer.cornerRadius = 12
            txt_view_up.clipsToBounds = true
            txt_view_up.backgroundColor = text_field_BG_color
        }
    }
    @IBOutlet weak var txt_view_down:UITextView! {
        didSet {
            txt_view_down.layer.cornerRadius = 12
            txt_view_down.clipsToBounds = true
            txt_view_down.backgroundColor = text_field_BG_color
        }
    }
    
    @IBOutlet weak var lbl_text_up:UILabel!
    @IBOutlet weak var lbl_text_down:UILabel!
    
    @IBOutlet weak var btn_translate:UIButton!  {
        didSet {
            btn_translate.backgroundColor = button_light_blue_color
            btn_translate.layer.cornerRadius = 12
            btn_translate.clipsToBounds = true
            btn_translate.setTitleColor(.white, for: .normal)
        }
    }
}
