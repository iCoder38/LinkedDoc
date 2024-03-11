//
//  text_language.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit


// SELECT LANGUAGE
var navigation_title_select_language_en = "select language".uppercased()
var navigation_title_select_language_ch = "chinese select language".uppercased()

var select_language_text_en = "Select the language to continue"
var select_language_text_ch = "chinese : Select language to continue"


// login
var navigation_title_login_en = "Welcome to LinkedDoc"
var navigation_title_login_ch = "chinese select language"

var navigation_title_login_text_en = "Please select an option to continue as a profile"
var navigation_title_login_text_ch = "Chinese : Please select an option to continue as a profile"

var button_text_doctor_continue_en = "Doctor"
var button_text_doctor_continue_ch = "Doctor ch"

var button_text_patient_continue_en = "Patient"
var button_text_patient_continue_ch = "Patient ch"

// create and account
var navigation_title_create_an_account_en = "Create an account"
var navigation_title_create_an_account_ch = "chinese : Create an account"

var text_field_name_placeholder_en = "Name"
var text_field_email_placeholder_en = "Email"
var text_field_phone_placeholder_en = "Phone"
var text_field_password_placeholder_en = "Password"

var text_field_name_placeholder_ch = "chinese : Name"
var text_field_email_placeholder_ch = "chinese : Email"
var text_field_phone_placeholder_ch = "chinese : Phone"
var text_field_password_placeholder_ch = "chinese : Password"

var text_create_an_account_en = "Create your account"
var text_create_an_account_ch = "chinese : Create your account"

var text_already_have_an_account_en = "Already have an account"
var text_already_have_an_account_ch = "chinese : Already have an account"

var button_text_create_an_account_en = "Create an account"
var button_text_create_an_account_ch = "chinese : Create an account"

// complete profile
var navigation_title_complete_profile_en = "Complete profile"
var navigation_title_complete_profile_ch = "chinese : Complete profile"

var text_field_complete_address_placeholder_en = "Complete address"
var text_field_area_zip_code_placeholder_en = "Area Zipcode"
var text_field_working_hours_placeholder_en = "Working Hours"
var text_field_year_of_exp_placeholder_en = "Year of Experience"
var text_field_specialization_placeholder_en = "Specialization"


var text_field_complete_address_placeholder_ch = "chinese : Complete address"
var text_field_area_zip_code_placeholder_ch = "chinese : Area Zipcode"
var text_field_working_hours_placeholder_ch = "chinese : Working hours"
var text_field_year_of_exp_placeholder_ch = "chinese : Year of Experience"
var text_field_specialization_placeholder_ch = "chinese : Specialization"


var button_text_finish_en = "Finish"
var button_text_finish_ch = "chinese : Finish"









// common
var button_text_continue_en = "Continue"
var button_text_continue_ch = "Continue CH"

class text_language: UIViewController {
    
    
    class func selected_language_get()->String {
        
        var str_language_prefrence_is:String!
        
        if let language_is = UserDefaults.standard.string(forKey: default_key_language) {
            print(language_is)
            if (language_is == english_language) {
                str_language_prefrence_is = english_language
            } else {
                str_language_prefrence_is = chinese_language
            }
        }
        
        return str_language_prefrence_is
    }
    
    // login
    class func login_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
    
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_login_en
            } else {
                str_language_prefrence_is = navigation_title_login_ch
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = select_language_text_en
            } else {
                str_language_prefrence_is = select_language_text_ch
            }
        } else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_doctor_continue_en
            } else {
                str_language_prefrence_is = button_text_doctor_continue_ch
            }
        } else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_patient_continue_en
            } else {
                str_language_prefrence_is = button_text_patient_continue_ch
            }
        } else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_login_text_en
            } else {
                str_language_prefrence_is = navigation_title_login_text_ch
            }
        }
        
        return str_language_prefrence_is
    }
    
    
    // create an account
    class func create_an_account_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_create_an_account_en
            } else {
                str_language_prefrence_is = navigation_title_create_an_account_ch
            }
        } else  if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_create_an_account_en
            } else {
                str_language_prefrence_is = text_create_an_account_ch
            }
        } else  if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_create_an_account_en
            } else {
                str_language_prefrence_is = button_text_create_an_account_ch
            }
        } else  if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_name_placeholder_en
            } else {
                str_language_prefrence_is = text_field_name_placeholder_ch
            }
        } else  if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_email_placeholder_en
            } else {
                str_language_prefrence_is = text_field_email_placeholder_ch
            }
        } else  if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_phone_placeholder_en
            } else {
                str_language_prefrence_is = text_field_phone_placeholder_ch
            }
        }  else  if (status == "#07") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_password_placeholder_en
            } else {
                str_language_prefrence_is = text_field_password_placeholder_ch
            }
        }  else  if (status == "#08") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_already_have_an_account_en
            } else {
                str_language_prefrence_is = text_already_have_an_account_ch
            }
        }
            
            
            
            
            
        return str_language_prefrence_is
    }
    
    // create an account
    class func complete_profile_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_complete_profile_en
            } else {
                str_language_prefrence_is = navigation_title_complete_profile_ch
            }
        }
        else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_complete_address_placeholder_en
            } else {
                str_language_prefrence_is = text_field_complete_address_placeholder_ch
            }
        }
        else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_area_zip_code_placeholder_en
            } else {
                str_language_prefrence_is = text_field_area_zip_code_placeholder_ch
            }
        }
        else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_working_hours_placeholder_en
            } else {
                str_language_prefrence_is = text_field_working_hours_placeholder_ch
            }
        }
        else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_year_of_exp_placeholder_en
            } else {
                str_language_prefrence_is = text_field_year_of_exp_placeholder_ch
            }
        }
        else if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_complete_profile_en
            } else {
                str_language_prefrence_is = navigation_title_complete_profile_ch
            }
        }
        else if (status == "#07") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_finish_en
            } else {
                str_language_prefrence_is = button_text_finish_ch
            }
        }
        
        
        return str_language_prefrence_is
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
