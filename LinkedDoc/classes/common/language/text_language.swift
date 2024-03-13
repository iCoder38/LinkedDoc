//
//  text_language.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit
import Alamofire

// SELECT LANGUAGE
var navigation_title_select_language_en = "select language".uppercased()
var navigation_title_select_language_ch = "chinese select language".uppercased()

var select_language_text_en = "Select the language to continue"
var select_language_text_ch = "chinese : Select language to continue"


// welcome
var navigation_title_welcome_en = "Welcome to LinkedDoc"
var navigation_title_welcome_ch = "歡迎醫生聯絡網"

var navigation_title_login_text_en = "Please select an option to continue as a profile"
var navigation_title_login_text_ch = "請選擇一個選項以繼續作為個人資料"

var button_text_doctor_continue_en = "Doctor"
var button_text_doctor_continue_ch = "醫生"

var button_text_patient_continue_en = "Patient"
var button_text_patient_continue_ch = "病人"

// login
var navigation_title_login_en = "Login"
var navigation_title_login_ch = "chinese Login"

var text_login_message_en = "Sign in to your account"
var text_login_message_ch = "登入您的帳戶"

var button_continue_en = "Continue"
var button_continue_ch = "請繼續"

var button_register_now_en = "register now"
var button_register_now_ch = "非會員？ 請註冊"

// create and account
var navigation_title_create_an_account_en = "Create an account"
var navigation_title_create_an_account_ch = "建立帳號"


var navigation_title_edit_profile_en = "Edit profile"
var navigation_title_edit_profile_ch = "編輯個人資料"

var text_field_name_placeholder_en = "Name"
var text_field_email_placeholder_en = "Email"
var text_field_phone_placeholder_en = "Phone"
var text_field_password_placeholder_en = "Password"

var text_field_name_placeholder_ch = "名字"
var text_field_email_placeholder_ch = "電子郵件地址"
var text_field_phone_placeholder_ch = "電話"
var text_field_password_placeholder_ch = "密碼"

var text_create_an_account_en = "Create your account"
var text_create_an_account_ch = "建立你的帳戶"

var text_already_have_an_account_en = "Already have an account"
var text_already_have_an_account_ch = "已經在帳號 - 請登入"

var button_text_create_an_account_en = "Create an account"
var button_text_create_an_account_ch = "建立帳號"

var button_text_update_an_account_en = "Update"
var button_text_update_an_account_ch = "ch: update"

// complete profile
var navigation_title_complete_profile_en = "Complete profile"
var navigation_title_complete_profile_ch = "填寫個人資料"

var text_field_complete_address_placeholder_en = "Complete address"
var text_field_area_zip_code_placeholder_en = "Area Zipcode"
var text_field_working_hours_placeholder_en = "Working Hours start"
var text_field_year_of_exp_placeholder_en = "Year of Experience"
var text_field_specialization_placeholder_en = "Specialization"
var text_field_working_hour_end_placeholder_en = "Working hours end"

var text_field_complete_address_placeholder_ch = "填寫地址"
var text_field_area_zip_code_placeholder_ch = "郵遞區號"
var text_field_working_hours_placeholder_ch = "chinese : Working hours start"
var text_field_year_of_exp_placeholder_ch = "經驗"
var text_field_specialization_placeholder_ch = "專業放射學"
var text_field_working_hour_end_placeholder_ch = "chinese : Working hours end"

var button_text_finish_en = "Finish"
var button_text_finish_ch = "完全"



// dashboard
var navigation_title_dashboard_en = "Dashboard"
var navigation_title_dashboard_ch = "儀表板"

var text_translate_en = "Translate"
var text_translate_ch = "翻譯"

var text_password_en = "Password"
var text_password_ch = "密碼"

var text_hep_en = "Help"
var text_hep_ch = "輔助說明"


// translate language
var navigation_title_translate_language_en = "Translate language"
var navigation_title_translate_language_ch = "翻譯 語言"

var button_text_en = "Translate".uppercased()
var button_text_ch = "翻譯".uppercased()

var text_translate_up_en = "Native Language: English"
var text_translate_up_ch = "母語/ 英文"

var text_translate_down_en = "Native Language: Chinese"
var text_translate_down_ch = "可選擇語言/ 中文"

// dashboard
var navigation_title_change_password_en = "Change Password"
var navigation_title_change_password_ch = "密碼更改"

var text_field_old_password_placeholder_en = "Old Password"
var text_field_new_password_placeholder_en = "New Password"
var text_field_confirm_password_placeholder_en = "Confirm Password"

var text_field_old_password_placeholder_ch = "ch : Old Password"
var text_field_new_password_placeholder_ch = "ch : New Password"
var text_field_confirm_password_placeholder_ch = "ch : Confirm Password"

var button_text_change_password_en = "Change Password"
var button_text_change_password_ch = "密碼更改"

// common
var button_text_continue_en = "Continue"
var button_text_continue_ch = "請繼續"

var text_please_wait_en = "please wait..."
var text_please_wait_ch = "ch : please wait..."

var text_updating_en = "updating..."
var text_updating_ch = "ch : updating..."

var text_dismiss_en = "dismiss..."
var text_dismiss_ch = "ch : dismiss"

var text_success_en = "Success"
var text_success_ch = "ch : Success"

var text_translating_en = "Translating"
var text_translating_ch = "ch : Translating"

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
    
    
    // common screen
    class func common_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "please_wait") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_please_wait_en
            } else {
                str_language_prefrence_is = text_please_wait_ch
            }
            
        } else  if (status == "updating") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_updating_en
            } else {
                str_language_prefrence_is = text_updating_ch
            }
            
        }  else  if (status == "dismiss") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_dismiss_en
            } else {
                str_language_prefrence_is = text_dismiss_ch
            }
            
        }   else  if (status == "success") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_success_en
            } else {
                str_language_prefrence_is = text_success_ch
            }
            
        }    else  if (status == "translating") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_translating_en
            } else {
                str_language_prefrence_is = text_translating_ch
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
                str_language_prefrence_is = text_login_message_en
            } else {
                str_language_prefrence_is = text_login_message_ch
            }
        } else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_continue_en
            } else {
                str_language_prefrence_is = button_continue_ch
            }
        }else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_email_placeholder_en
            } else {
                str_language_prefrence_is = text_field_email_placeholder_ch
            }
        }else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_password_placeholder_en
            } else {
                str_language_prefrence_is = text_field_password_placeholder_ch
            }
        } else if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_register_now_en
            } else {
                str_language_prefrence_is = button_register_now_ch
            }
        }
        return str_language_prefrence_is
    }
    
    // welcome
    class func welcome_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
    
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_welcome_en
            } else {
                str_language_prefrence_is = navigation_title_welcome_ch
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
        }   else  if (status == "#09") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_update_an_account_en
            } else {
                str_language_prefrence_is = button_text_update_an_account_ch
            }
        }    else  if (status == "#10") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_edit_profile_en
            } else {
                str_language_prefrence_is = navigation_title_edit_profile_ch
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
                str_language_prefrence_is = text_field_specialization_placeholder_en
            } else {
                str_language_prefrence_is = text_field_specialization_placeholder_ch
            }
        }
        else if (status == "#07") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_finish_en
            } else {
                str_language_prefrence_is = button_text_finish_ch
            }
        }else if (status == "#08") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_working_hour_end_placeholder_en
            } else {
                str_language_prefrence_is = text_field_working_hour_end_placeholder_ch
            }
        }
        
        
        return str_language_prefrence_is
        
    }
    
    // dashboard
    class func dashboard_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_dashboard_en
            } else {
                str_language_prefrence_is = navigation_title_dashboard_ch
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_translate_en
            } else {
                str_language_prefrence_is = text_translate_ch
            }
        } else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_password_en
            } else {
                str_language_prefrence_is = text_password_ch
            }
        } else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_hep_en
            } else {
                str_language_prefrence_is = text_hep_ch
            }
        }
        
        return str_language_prefrence_is
    }
    
    
    
    // translate language
    class func translate_language_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_translate_language_en
            } else {
                str_language_prefrence_is = navigation_title_translate_language_ch
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_en
            } else {
                str_language_prefrence_is = button_text_ch
            }
        }  else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_translate_up_en
            } else {
                str_language_prefrence_is = text_translate_up_ch
            }
        }  else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_translate_down_en
            } else {
                str_language_prefrence_is = text_translate_down_ch
            }
        }
        
        return str_language_prefrence_is
    }
    
    
    // create an account
    class func change_password_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_change_password_en
            } else {
                str_language_prefrence_is = navigation_title_change_password_ch
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_old_password_placeholder_en
            } else {
                str_language_prefrence_is = text_field_old_password_placeholder_ch
            }
        }else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_new_password_placeholder_en
            } else {
                str_language_prefrence_is = text_field_new_password_placeholder_ch
            }
        }else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_confirm_password_placeholder_en
            } else {
                str_language_prefrence_is = text_field_confirm_password_placeholder_ch
            }
        } else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_change_password_en
            } else {
                str_language_prefrence_is = button_text_change_password_ch
            }
        }
        
        return str_language_prefrence_is
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
