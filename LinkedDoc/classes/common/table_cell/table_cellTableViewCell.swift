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
            txt_email.keyboardType = .emailAddress
        }
    }
    
    @IBOutlet weak var img_profile:UIImageView! {
        didSet {
            img_profile.layer.cornerRadius = 70
            img_profile.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var txt_phone:UITextField! {
        didSet {
            txt_phone.layer.cornerRadius = 12
            txt_phone.clipsToBounds = true
            txt_phone.backgroundColor = text_field_BG_color
            txt_phone.placeholder = "Phone"
            txt_phone.setLeftPaddingPoints(20)
            txt_phone.keyboardType = .phonePad
        }
    }
    @IBOutlet weak var txt_password:UITextField! {
        didSet {
            txt_password.layer.cornerRadius = 12
            txt_password.clipsToBounds = true
            txt_password.backgroundColor = text_field_BG_color
            txt_password.placeholder = "Password"
            txt_password.setLeftPaddingPoints(20)
            txt_password.isSecureTextEntry = true
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

// /* ************** UPDATE PROFILE ************************ */
// /* ********************************************************** */
class updating_profile_table_cell : UITableViewCell {
    
    @IBOutlet weak var view_under_image:UIView! {
        didSet {
            view_under_image.layer.cornerRadius = 8
            view_under_image.clipsToBounds = true
            view_under_image.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var img_profile:UIImageView! {
        didSet {
            img_profile.layer.cornerRadius = 70
            img_profile.clipsToBounds = true
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
            txt_email.isUserInteractionEnabled = false
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
            txt_phone.keyboardType = .phonePad
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


// /* ************** ADD HEALTH JOURNAL ****************** */
// /* ********************************************************** */
class region_table_cell : UITableViewCell {
    
    @IBOutlet weak var txt_view_one:UITextView! {
        didSet {
            txt_view_one.layer.cornerRadius = 12
            txt_view_one.clipsToBounds = true
            txt_view_one.backgroundColor = text_field_BG_color
        }
    }
    
    @IBOutlet weak var txt_view_two:UITextView! {
        didSet {
            txt_view_two.layer.cornerRadius = 12
            txt_view_two.clipsToBounds = true
            txt_view_two.backgroundColor = text_field_BG_color
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
    
    @IBOutlet weak var lbl_where_is:UILabel!
    @IBOutlet weak var lbl_is_there:UILabel!
    
    @IBOutlet weak var lbl_pd1:UILabel!
    @IBOutlet weak var lbl_pd2:UILabel!
    
    @IBOutlet weak var btn_skip:UIButton!
}

// /* ************** ADD HEALTH JOURNAL ****************** */
// /* ********************************************************** */
class journal_list_table_cell : UITableViewCell {
    
    @IBOutlet weak var lbl_title:UILabel! {
        didSet {
            
        }
    }
    
}

// /* ************** ADD HEALTH JOURNAL ****************** */
// /* ********************************************************** */
class doctor_details_table_cell : UITableViewCell {
    
    
    @IBOutlet weak var lbl_title:UILabel!
    @IBOutlet weak var lbl_sub_title:UILabel!
    
    
    
    @IBOutlet weak var clView: UICollectionView! {
        didSet {
            //collection
            // Do any additional setup after loading the view, typically from a nib
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            clView!.backgroundColor = .clear
            clView.isPagingEnabled = true
        }
    }
}

// /* ************** DOCTORS LIST ****************** */
// /* ********************************************************** */
class doctors_list_table_cell : UITableViewCell {
    
    @IBOutlet weak var img_profile:UIImageView! {
        didSet {
            img_profile.layer.cornerRadius = 40
            img_profile.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var img_open_status:UIImageView! {
        didSet {
            img_open_status.layer.cornerRadius = 5
            img_open_status.clipsToBounds = true
        }
    }
    @IBOutlet weak var lbl_title:UILabel!
    @IBOutlet weak var lbl_address:UILabel!
    @IBOutlet weak var lbl_speciality:UILabel!
    
}
// /* ************** DOCTOR DETAILS ****************** */
// /* ********************************************************** */
class details_table_cell : UITableViewCell {
    
    @IBOutlet weak var lbl_title:UILabel!
    @IBOutlet weak var lbl_sub_title:UILabel!
    
}

// /* ************** ADD HEALTH JOURNAL ****************** */
// /* ********************************************************** */
class add_health_journal_table_cell : UITableViewCell {
    
    @IBOutlet weak var txt_BP:UITextField! {
        didSet {
            txt_BP.layer.cornerRadius = 12
            txt_BP.clipsToBounds = true
            txt_BP.backgroundColor = text_field_BG_color
            txt_BP.placeholder = "Blood Pressure"
            txt_BP.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_weight:UITextField! {
        didSet {
            txt_weight.layer.cornerRadius = 12
            txt_weight.clipsToBounds = true
            txt_weight.backgroundColor = text_field_BG_color
            txt_weight.placeholder = "Weight"
            txt_weight.setLeftPaddingPoints(20)
            txt_weight.keyboardType = .numberPad
        }
    }
    @IBOutlet weak var txt_minute_of_excercise:UITextField! {
        didSet {
            txt_minute_of_excercise.layer.cornerRadius = 12
            txt_minute_of_excercise.clipsToBounds = true
            txt_minute_of_excercise.backgroundColor = text_field_BG_color
            txt_minute_of_excercise.placeholder = "Minute of Excercise"
            txt_minute_of_excercise.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_notable_event:UITextField! {
        didSet {
            txt_notable_event.layer.cornerRadius = 12
            txt_notable_event.clipsToBounds = true
            txt_notable_event.backgroundColor = text_field_BG_color
            txt_notable_event.placeholder = "Notable events"
            txt_notable_event.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var btn_continue:UIButton!  {
        didSet {
            btn_continue.backgroundColor = button_light_blue_color
            btn_continue.layer.cornerRadius = 12
            btn_continue.clipsToBounds = true
            btn_continue.setTitleColor(.white, for: .normal)
        }
    }
    
    @IBOutlet weak var btn_notable_event:UIButton!
    
    @IBOutlet weak var lbl_blood_pressure:UILabel!
    @IBOutlet weak var lbl_weight:UILabel!
    @IBOutlet weak var lbl_minute_of_excercise:UILabel!
    @IBOutlet weak var lbl_notable_events:UILabel!
    
    
    
    
}

// /* ************** PATIENT COMPLETE PROFILE ****************** */
// /* ********************************************************** */
class patient_complete_profile_table_cell : UITableViewCell {
    
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
            txt_area_zipcode.keyboardType = .numberPad
        }
    }
    
    @IBOutlet weak var txt_gender:UITextField! {
        didSet {
            txt_gender.layer.cornerRadius = 12
            txt_gender.clipsToBounds = true
            txt_gender.backgroundColor = .white
            txt_gender.placeholder = "Gender"
            txt_gender.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_weight:UITextField! {
        didSet {
            txt_weight.layer.cornerRadius = 12
            txt_weight.clipsToBounds = true
            txt_weight.backgroundColor = .white
            txt_weight.placeholder = "Weight"
            txt_weight.setLeftPaddingPoints(20)
            txt_weight.keyboardType = .numberPad
        }
    }
    @IBOutlet weak var txt_blood_group:UITextField! {
        didSet {
            txt_blood_group.layer.cornerRadius = 12
            txt_blood_group.clipsToBounds = true
            txt_blood_group.backgroundColor = .white
            txt_blood_group.placeholder = "Blood group"
            txt_blood_group.setLeftPaddingPoints(20)
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
    @IBOutlet weak var btn_gender:UIButton!
}

// /* ************** TRANSLATE LANGUAGE ************************ */
// /* ********************************************************** */


// /* ************** EDIT : COMPLETE PROFILE ************************ */
// /* ********************************************************** */
class update_patient_details_table_cell : UITableViewCell {
    
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
            txt_area_zipcode.keyboardType = .numberPad
        }
    }
    
    @IBOutlet weak var txt_gender:UITextField! {
        didSet {
            txt_gender.layer.cornerRadius = 12
            txt_gender.clipsToBounds = true
            txt_gender.backgroundColor = .white
            txt_gender.placeholder = "Gender"
            txt_gender.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_weight:UITextField! {
        didSet {
            txt_weight.layer.cornerRadius = 12
            txt_weight.clipsToBounds = true
            txt_weight.backgroundColor = .white
            txt_weight.placeholder = "Weight"
            txt_weight.setLeftPaddingPoints(20)
            txt_weight.keyboardType = .numberPad
        }
    }
    @IBOutlet weak var txt_blood_group:UITextField! {
        didSet {
            txt_blood_group.layer.cornerRadius = 12
            txt_blood_group.clipsToBounds = true
            txt_blood_group.backgroundColor = .white
            txt_blood_group.placeholder = "Blood group"
            txt_blood_group.setLeftPaddingPoints(20)
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
    @IBOutlet weak var btn_gender:UIButton!
    
    @IBOutlet weak var lbl_address:UILabel!
    @IBOutlet weak var lbl_area_zipcode:UILabel!
    @IBOutlet weak var lbl_gender:UILabel!
    @IBOutlet weak var lbl_weight:UILabel!
    @IBOutlet weak var lbl_blood_group:UILabel!
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
            txt_area_zipcode.keyboardType = .numberPad
        }
    }
    
    @IBOutlet weak var txt_working_hours:UITextField! {
        didSet {
            txt_working_hours.layer.cornerRadius = 12
            txt_working_hours.clipsToBounds = true
            txt_working_hours.backgroundColor = .white
            txt_working_hours.placeholder = "Working hours start"
            txt_working_hours.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_working_hours_end:UITextField! {
        didSet {
            txt_working_hours_end.layer.cornerRadius = 12
            txt_working_hours_end.clipsToBounds = true
            txt_working_hours_end.backgroundColor = .white
            txt_working_hours_end.placeholder = "Working hours end"
            txt_working_hours_end.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_year_of_experience:UITextField! {
        didSet {
            txt_year_of_experience.layer.cornerRadius = 12
            txt_year_of_experience.clipsToBounds = true
            txt_year_of_experience.backgroundColor = .white
            txt_year_of_experience.placeholder = "Year of experience"
            txt_year_of_experience.setLeftPaddingPoints(20)
            txt_year_of_experience.keyboardType = .numberPad
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
    @IBOutlet weak var btn_start_time:UIButton!
    @IBOutlet weak var btn_end_time:UIButton!
    @IBOutlet weak var lbl_about:UILabel!
}

// /* ************** DOCTOR : EDIT COMPLETE PROFILE ************************ */
// /* ********************************************************** */
class update_doctor_details_table_cell : UITableViewCell {
    
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
            txt_area_zipcode.keyboardType = .numberPad
        }
    }
    
    @IBOutlet weak var txt_working_hours:UITextField! {
        didSet {
            txt_working_hours.layer.cornerRadius = 12
            txt_working_hours.clipsToBounds = true
            txt_working_hours.backgroundColor = .white
            txt_working_hours.placeholder = "Working hours start"
            txt_working_hours.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_working_hours_end:UITextField! {
        didSet {
            txt_working_hours_end.layer.cornerRadius = 12
            txt_working_hours_end.clipsToBounds = true
            txt_working_hours_end.backgroundColor = .white
            txt_working_hours_end.placeholder = "Working hours end"
            txt_working_hours_end.setLeftPaddingPoints(20)
        }
    }
    @IBOutlet weak var txt_year_of_experience:UITextField! {
        didSet {
            txt_year_of_experience.layer.cornerRadius = 12
            txt_year_of_experience.clipsToBounds = true
            txt_year_of_experience.backgroundColor = .white
            txt_year_of_experience.placeholder = "Year of experience"
            txt_year_of_experience.setLeftPaddingPoints(20)
            txt_year_of_experience.keyboardType = .numberPad
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
    @IBOutlet weak var btn_start_time:UIButton!
    @IBOutlet weak var btn_end_time:UIButton!
    
    @IBOutlet weak var lbl_address:UILabel!
    @IBOutlet weak var lbl_zipcode:UILabel!
    @IBOutlet weak var lbl_working_hr_start:UILabel!
    @IBOutlet weak var lbl_working_hr_end:UILabel!
    @IBOutlet weak var lbl_year_of_experience:UILabel!
    @IBOutlet weak var lbl_specialization:UILabel!
    @IBOutlet weak var lbl_about_us:UILabel!
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
            txt_view_down.isEditable = false
            txt_view_down.isSelectable = true
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

// /* ************** TRANSLATE LANGUAGE ************************ */
// /* ********************************************************** */
class change_password_table_cell : UITableViewCell {
    
    @IBOutlet weak var view_bottom:UIView! {
        didSet {
            view_bottom.layer.cornerRadius = 12
            view_bottom.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var txt_old_password:UITextField! {
        didSet {
            txt_old_password.layer.cornerRadius = 12
            txt_old_password.clipsToBounds = true
            txt_old_password.backgroundColor = text_field_BG_color
            txt_old_password.placeholder = "Current password"
            txt_old_password.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var txt_new_password:UITextField! {
        didSet {
            txt_new_password.layer.cornerRadius = 12
            txt_new_password.clipsToBounds = true
            txt_new_password.backgroundColor = text_field_BG_color
            txt_new_password.placeholder = "New password"
            txt_new_password.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var txt_confirm_password:UITextField! {
        didSet {
            txt_confirm_password.layer.cornerRadius = 12
            txt_confirm_password.clipsToBounds = true
            txt_confirm_password.backgroundColor = text_field_BG_color
            txt_confirm_password.placeholder = "Confirm password"
            txt_confirm_password.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var btn_change_password:UIButton!  {
        didSet {
            btn_change_password.backgroundColor = button_light_blue_color
            btn_change_password.layer.cornerRadius = 12
            btn_change_password.clipsToBounds = true
            btn_change_password.setTitleColor(.white, for: .normal)
        }
    }
}
