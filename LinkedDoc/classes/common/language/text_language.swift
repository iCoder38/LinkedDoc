//
//  text_language.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit
import Alamofire
/*
// SELECT LANGUAGE
var navigation_title_select_language_en = "select language".uppercased()
var navigation_title_select_language_ch = "選擇你的語言".uppercased()

var select_language_text_en = "Select the language to continue"
var select_language_text_ch = "請選擇你的語言 才能繼續"


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
var navigation_title_login_en = "Sign in"
var navigation_title_login_ch = "登入"

var text_login_message_en = "Sign in to your account"
var text_login_message_ch = "登入您的帳戶"

var button_continue_en = "Continue"
var button_continue_ch = "請繼續"

var button_add_journal_en = "Save health journal"
var button_add_journal_ch = "保存個人健康日誌"

var button_done_en = "Done"
var button_done_ch = "完畢"

var text_about_doctor_en = "About Doctor"
var text_about_doctor_ch = "關於醫生"


var text_please_install_whatsapp_en = "Please install whatsapp"
var text_please_install_whatsapp_ch = "請安裝whatsapp"

var text_enable_your_location_en = "Please enable your location and try again"
var text_enable_your_location_ch = "請啟用您的位置並重試"

var button_register_now_en = "register now"
var button_register_now_ch = "非會員？ 請註冊"

var text_alert_en = "Alert"
var text_alert_ch = "警報"

var text_forgot_password_en = "Forgot Password"
var text_forgot_password_ch = "Forgot Password"



var text_delete_account_en = "Are you sure you want to delete your account ?"
var text_delete_account_ch = "您確定要刪除您的帳戶嗎？"


var text_delete_en = "delete"
var text_delete_ch = "刪除"


// help
var navigation_title_help_en = "Help"
var navigation_title_help_ch = "輔助說明"

var text_connect_with_us_en = "CONNECT WITH US"
var text_connect_with_us_ch = "請跟我們聯絡"

var text_whatsapp_en = "Whatsapp"
var text_whatsapp_ch = "電話號碼"

var text_support_en = "Support"
var text_support_ch = "電子信箱"

var text_all_rights_reserved_en = "©2024 LinkedDoc. All Rights Reserved."
var text_all_rights_reserved_ch = "@2024 醫生聯絡網. 保留所有權利."

// create and account
var navigation_title_create_an_account_en = "Create an account"
var navigation_title_create_an_account_ch = "建立帳號"


var navigation_title_edit_profile_en = "Edit profile"
var navigation_title_edit_profile_ch = "編輯個人資料"


var navigation_title_edit_details_en = "Edit details"
var navigation_title_edit_details_ch = "編輯個人資料"

var text_about_en = "About"
var text_about_ch = "有關醫生資料"

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
var button_text_update_an_account_ch = "更新"

// complete profile
var navigation_title_complete_profile_en = "Complete profile"
var navigation_title_complete_profile_ch = "填寫個人資料"

var text_field_complete_address_placeholder_en = "Complete address"
var text_field_area_zip_code_placeholder_en = "Area Zipcode"
var text_field_working_hours_placeholder_en = "Working Hours start"
var text_field_year_of_exp_placeholder_en = "Year of Experience"
var text_field_specialization_placeholder_en = "Specialization"
var text_field_working_hour_end_placeholder_en = "Working hours end"

var text_field_gender_placeholder_en = "Gender"
var text_field_weight_placeholder_en = "Weight"
var text_field_blood_group_placeholder_en = "Blood group"

var text_field_complete_address_placeholder_ch = "填寫地址"
var text_field_area_zip_code_placeholder_ch = "郵遞區號"
var text_field_working_hours_placeholder_ch = "工作時間 (開始/開門）"
var text_field_year_of_exp_placeholder_ch = "經驗"
var text_field_specialization_placeholder_ch = "專業放射學"
var text_field_working_hour_end_placeholder_ch = "工作時間 (结束/關門"

var text_field_gender_placeholder_ch = "性別"
var text_field_weight_placeholder_ch = "體重"
var text_field_blood_group_placeholder_ch = "血型"

var button_text_finish_en = "Finish"
var button_text_finish_ch = "完全"


// region
var navigation_title_region_en = "Region"
var navigation_title_region_ch = "病痛地方"

var text_what_is_pain_located_en = "Where is pain located, does it radiate anywhere"
var text_what_is_pain_located_ch = "病痛地方，是不是有擴散到其他地方"

var text_is_there_any_pain_en = "is there pain anywhere other than the site of stimulus"
var text_is_there_any_pain_ch = "除了刺激部位之外還有其他地方疼痛嗎"

// journal
var navigation_title_journal_en = "Journal"
var navigation_title_journal_ch = "個人健康日誌"

// dashboard
var navigation_title_dashboard_en = "Dashboard"
var navigation_title_dashboard_ch = "儀表板"

var navigation_title_nearby_doctors_en = "Nearby Doctors"
var navigation_title_nearby_doctors_ch = "儀表板"

var text_translate_en = "Translate"
var text_translate_ch = "翻譯"

var text_password_en = "Password"
var text_password_ch = "密碼"

var text_hep_en = "Help"
var text_hep_ch = "輔助說明"


var text_journal_en = "Journal"
var text_journal_ch = "加上日誌記錄"


var text_search_doctor_en = "Search Doctor"
var text_search_doctor_ch = "醫生搜尋"

var text_add_journal_en = "Add Journal"
var text_add_journal_ch = "加上日誌記錄"



var text_logout_en = "Logout"
var text_logout_ch = " 登出"


// translate language
var navigation_title_translate_language_en = "Translate language"
var navigation_title_translate_language_ch = "翻譯 語言"

var button_text_en = "Translate".uppercased()
var button_text_ch = "翻譯".uppercased()

var text_translate_up_en = "Native Language: English"
var text_translate_up_ch = "母語/ 英文"

var text_translate_down_en = "Selective Language: Chinese"
var text_translate_down_ch = "可選擇語言/ 中文"




var text_translate2_up_en = "Native Language: Chinese"
var text_translate2_up_ch = "母語/ 英文"

var text_translate2_down_en = "Selective Language: English"
var text_translate2_down_ch = "可選擇語言/ 中文"




// dashboard
var navigation_title_change_password_en = "Change Password"
var navigation_title_change_password_ch = "密碼更改"

var text_field_old_password_placeholder_en = "Old Password"
var text_field_new_password_placeholder_en = "New Password"
var text_field_confirm_password_placeholder_en = "Confirm Password"
var text_field_otp_placeholder_en = "OTP"

var text_field_old_password_placeholder_ch = "舊密碼"
var text_field_new_password_placeholder_ch = "新密碼"
var text_field_confirm_password_placeholder_ch = "確定密碼"
var text_field_otp_placeholder_ch = "奧特普"

var button_text_change_password_en = "Change Password"
var button_text_change_password_ch = "密碼更改"

// common
var button_text_continue_en = "Continue"
var button_text_continue_ch = "請繼續"

var text_please_wait_en = "please wait..."
var text_please_wait_ch = "請稍待一下"

var text_updating_en = "updating..."
var text_updating_ch = "更新"

var text_dismiss_en = "Dismiss"
var text_dismiss_ch = "解除"

var text_success_en = "Success"
var text_success_ch = "成功"

var text_translating_en = "Translating"
var text_translating_ch = "翻譯"

var text_upload_en = "Upload profile picture"
var text_upload_ch = "更新個人資料照片"

var text_camera_en = "Camera"
var text_camera_ch = "相機"

var text_gallery_en = "Gallery"
var text_gallery_ch = "資料庫"

var text_are_you_sure_logout_en = "Are you sure you want to logout?"
var text_are_you_sure_logout_ch = "請確定你要登出"

// health journal
var navigation_title_add_health_general_en = "add health journal".uppercased()
var navigation_title_add_health_general_ch = "加上健康日誌".uppercased()

var text_blood_pressure_en = "Blood Pressure"
var text_blood_pressure_ch = "血壓"

var text_weight_en = "Weight"
var text_weight_ch = "體重"

var text_minute_of_excercise_en = "Exercise Duration"
var text_minute_of_excercise_ch = "運動時間"

var text_notable_events_en = "Event type"
var text_notable_events_ch = "事件類型"

var text_pain_en = "Pain"
var text_pain_ch = "身體不舒服"

var text_diff_breathing_en = "Difficult breathing/moving"
var text_diff_breathing_ch = "呼吸困難，身體移動困難等"

var text_male_en = "Male"
var text_male_ch = "男性"

var text_female_en = "Female"
var text_female_ch = "女性"

// onset
var navigation_title_onset_en = "onset".uppercased()
var navigation_title_onset_ch = "發作".uppercased()

var text_what_were_you_doing_en = "What were you doing when this event began"
var text_what_were_you_doing_ch = "你有做什麼去減輕痛苦"

var text_describe_en = "Please describe"
var text_describe_ch = "請描述"

var button_skip_en = "skip".uppercased()
var button_skip_ch = "請跳過".uppercased()



var text_constant_options_en = "Please describe"
var text_constant_options_ch = "請描述"


var text_dull_option_dull_en = "Dull"
var text_dull_option_dull_ch = "身體沒反應"

var text_dull_option_sharp_en = "Sharp"
var text_dull_option_sharp_ch = "身體劇痛"

var text_dull_option_pressure_en = "Pressure"
var text_dull_option_pressure_ch = "身體壓力指數"

var text_dull_option_throbing_en = "Throbing"
var text_dull_option_throbing_ch = "身體悸動"

var text_dull_option_burning_en = "Burning"
var text_dull_option_burning_ch = "身體灼熱"

var text_dull_option_other_en = "Other"
var text_dull_option_other_ch = "其他"


var text_constant_option_constant_en = "Constant"
var text_constant_option_constant_ch = "持續"

var text_constant_option_intermittent_en = "Intermittent"
var text_constant_option_intermittent_ch = "間歇性"

var text_constant_option_other_en = "Other"
var text_constant_option_other_ch = "其他"


// provocation
var navigation_title_provocation_en = "Provocation".uppercased()
var navigation_title_provocation_ch = "病痛加重".uppercased()

var text_prov_message_en = "Is there anything that makes it better or worse (moving / medication)"
var text_prov_message_ch = "做什麼去減輕或加重病痛 (身體移動/ 藥物"

// quality
var navigation_title_quality_en = "Quality".uppercased()
var navigation_title_quality_ch = "身體狀況".uppercased()

var text_describe_pain_en = "Describe pain"
var text_describe_pain_ch = "描述病痛程度"

var text_dull_en = "Dull"
var text_dull_ch = "身體反應"

var text_constant_en = "Constant"
var text_constant_ch = "恆量 "

// severity
var navigation_title_severity_en = "Severity".uppercased()
var navigation_title_severity_ch = "嚴重度".uppercased()

var text_how_sever_en = "How severe on a scale of 1-10"
var text_how_sever_ch = "嚴重的程度 1-10 分數"

var text_field_please_select_en = "Please select"
var text_field_please_select_ch = "請選項"

// timings
var navigation_title_timings_en = "Timing".uppercased()
var navigation_title_timings_ch = "時間".uppercased()

var text_what_time_event_start_en = "What time did event start, How long did it last, has it happened before "
var text_what_time_event_start_ch = "什麼時候開始不舒服, 它持續多久, 它以前有發生過嗎"

// actions
var navigation_title_actions_en = "Actions".uppercased()
var navigation_title_actions_ch = "採取措施".uppercased()

var text_what_action_if_any_en = "What actions if any did you take"
var text_what_action_if_any_ch = "你有做什麼措施"

var text_action_medication_en = "Medication"
var text_action_medication_ch = "藥物"

var text_action_ice_en = "Ice"
var text_action_ice_ch = "冰敷"

var text_action_change_activity_food_en = "Change in activity"
var text_action_change_activity_food_ch = "改變作息"

var text_action_water_intake_en = "Food/Water Intake"
var text_action_water_intake_ch = "食物和飲水的習慣"

// DOCTOS CATEGORY
var text_doctor_details_name_en = "Name"
var text_doctor_details_name_ch = "姓名"

var text_doctor_details_phone_number_en = "Phone number"
var text_doctor_details_phone_number_ch = "電話號碼"

var text_doctor_details_address_en = "Address"
var text_doctor_details_address_ch = "地址 "

var text_doctor_details_website_en = "Website"
var text_doctor_details_website_ch = "網站"

var text_doctor_details_rating_en = "Rating"
var text_doctor_details_rating_ch = "評分"

var text_doctor_details_days_and_timings_en = "Days and Timings"
var text_doctor_details_days_and_timings_ch = "日期 和時間"

var text_doctor_details_photos_en = "Photos"
var text_doctor_details_photos_ch = "照片"

var text_doctor_details_open_en = "Open"
var text_doctor_details_open_ch = "開門時間"

var text_doctor_details_close_en = "Close"
var text_doctor_details_close_ch = "關門時間"



var text_doctor_Pediatrician_en = "Pediatrician"
var text_doctor_Pediatrician_ch = "小兒科醫生"

var text_doctor_Cardiologist_en = "Cardiologist"
var text_doctor_Cardiologist_ch = "心臟科醫生"

var text_doctor_Endocrinologist_en = "Endocrinologist"
var text_doctor_Endocrinologist_ch = "內分泌科醫生"



var text_doctor_Gynecologist_en = "Gynecologist"
var text_doctor_Gynecologist_ch = "婦產科醫生"

var text_doctor_Neurologist_en = "Neurologist"
var text_doctor_Neurologist_ch = "神經科醫生"

var text_doctor_Psychiatrist_en = "Psychiatrist"
var text_doctor_Psychiatrist_ch = "精神科醫生"



var text_doctor_Dermatologist_en = "Dermatologist"
var text_doctor_Dermatologist_ch = "皮膚科醫生"

var text_doctor_Oncologist_en = "Oncologist"
var text_doctor_Oncologist_ch = "腫瘤科醫生"

var text_doctor_Physicians_en = "Physicians"
var text_doctor_Physicians_ch = "般醫生"



var text_doctor_Otolaryngologist_en = "Otolaryngologist"
var text_doctor_Otolaryngologist_ch = "耳鼻喉科醫生"

var text_doctor_Radiologist_en = "Radiologist"
var text_doctor_Radiologist_ch = "放射科醫生"

var text_doctor_Emergency_Medicine_en = "Emergency Medicine"
var text_doctor_Emergency_Medicine_ch = "急診室醫生"



var text_doctor_Gastroenterologist_en = "Gastroenterologist"
var text_doctor_Gastroenterologist_ch = "胃腸科醫生"

var text_doctor_Ophthalmologist_en = "Ophthalmologist"
var text_doctor_Ophthalmologist_ch = "眼科醫生"

var text_doctor_Orthopedist_en = "Orthopedist"
var text_doctor_Orthopedist_ch = "骨科醫生"




var text_doctor_Pulmonologist_en = "Pulmonologist"
var text_doctor_Pulmonologist_ch = "肺科醫生"

var text_doctor_Allergist_en = "Allergist"
var text_doctor_Allergist_ch = "過敏科醫生"

var text_doctor_Internists_en = "Internists"
var text_doctor_Internists_ch = "內科醫生"



var text_doctor_Nephrologist_en = "Nephrologist"
var text_doctor_Nephrologist_ch = "腎臟科醫生"

var text_doctor_Dentist_en = "Dentist"
var text_doctor_Dentist_ch = "牙醫"

var text_doctor_Geriatrician_en = "Geriatrician"
var text_doctor_Geriatrician_ch = "老年科醫生"



var text_doctor_Epidemiologist_en = "Epidemiologist"
var text_doctor_Epidemiologist_ch = "流行病科醫生"

var text_doctor_Podiatrist_en = "Podiatrist"
var text_doctor_Podiatrist_ch = "足科醫生"

var text_doctor_Surgeon_en = "Surgeon"
var text_doctor_Surgeon_ch = "外科手術醫生"
*/
// Add a text in spanish Language
// SELECT LANGUAGE
var navigation_title_select_language_en = "select language".uppercased()
var navigation_title_select_language_ch = "選擇你的語言".uppercased()
var navigation_title_select_language_sp = "seleccione el idioma".uppercased()

var select_language_text_en = "Select the language to continue"
var select_language_text_ch = "請選擇你的語言 才能繼續"
var select_language_text_sp = "Seleccione el idioma para continuar "

// welcome
var navigation_title_welcome_en = "Welcome to LinkedDoc"
var navigation_title_welcome_ch = "歡迎醫生聯絡網"
var navigation_title_welcome_sp = "  Bienvenido a LinkedDoc  "

var navigation_title_login_text_en = "Please select an option to continue as a profile"
var navigation_title_login_text_ch = "請選擇一個選項以繼續作為個人資料"
var navigation_title_login_text_sp = "   Por favor seleccione una opción para continuar como perfil  "

var button_text_doctor_continue_en = "Doctor"
var button_text_doctor_continue_ch = "醫生"
var button_text_doctor_continue_sp = " Doctor"

var button_text_patient_continue_en = "Patient"
var button_text_patient_continue_ch = "病人"
var button_text_patient_continue_sp = "  Paciente   "

// login
var navigation_title_login_en = "Sign in"
var navigation_title_login_ch = "登入"
var navigation_title_login_sp = " iniciar sesión "

var text_login_message_en = "Sign in to your account"
var text_login_message_ch = "登入您的帳戶"
var text_login_message_sp = " Iniciar sesión en su cuenta "

var button_continue_en = "Continue"
var button_continue_ch = "請繼續"
var button_continue_sp = "continuar "

var button_add_journal_en = "Save health journal"
var button_add_journal_ch = "保存個人健康日誌"
var button_add_journal_sp = " Guardar diario de salud "

var button_done_en = "Done"
var button_done_ch = "完畢"
var button_done_sp = " Hecho "

var text_about_doctor_en = "About Doctor"
var text_about_doctor_ch = "關於醫生"
var text_about_doctor_sp = "Sobre el doctor "


var text_please_install_whatsapp_en = "Please install whatsapp"
var text_please_install_whatsapp_ch = "請安裝whatsapp"
var text_please_install_whatsapp_sp = "por favor instale whatsapp "

var text_enable_your_location_en = "Please enable your location and try again"
var text_enable_your_location_ch = "請啟用您的位置並重試"
var text_enable_your_location_sp = " Por favor habilita tu ubicación y vuelve a intentarlo"

var button_register_now_en = "register now"
var button_register_now_ch = "非會員？ 請註冊"
var button_register_now_sp = "Regístrate ahora "

var text_alert_en = "Alert"
var text_alert_ch = "警報"
var text_alert_sp = "alerta"

var text_forgot_password_en = "Forgot Password"
var text_forgot_password_ch = "忘記密碼"
var text_forgot_password_sp = "Has olvidado tu contraseña "

var text_delete_account_en = "Are you sure you want to delete your account ?"
var text_delete_account_ch = "您確定要刪除您的帳戶嗎？"
var text_delete_account_sp = "Estás seguro de que quieres eliminar tu cuenta?"

var text_delete_en = "delete"
var text_delete_ch = "刪除"
var text_delete_sp = "borrar"

// help
var navigation_title_help_en = "Help"
var navigation_title_help_ch = "輔助說明"
var navigation_title_help_sp = "ayuda "

var text_connect_with_us_en = "CONNECT WITH US"
var text_connect_with_us_ch = "聯絡我們"
var text_connect_with_us_sp = "Conéctate con nosotros "

var text_whatsapp_en = "Whatsapp"
var text_whatsapp_ch = "電話號碼"
var text_whatsapp_sp = " "

var text_support_en = "Support"
var text_support_ch = "電子信箱"
var text_support_sp = " "

var text_all_rights_reserved_en = "©2024 LinkedDoc. All Rights Reserved."
var text_all_rights_reserved_ch = "@2024 醫生聯絡網. 保留所有權利."
var text_all_rights_reserved_sp = "@2024 LinkedDoc. Reservados todos los derechos  "

// create and account
var navigation_title_create_an_account_en = "Create an account"
var navigation_title_create_an_account_ch = "建立帳號"
var navigation_title_create_an_account_sp = " crea una cuenta "

var navigation_title_edit_profile_en = "Edit profile"
var navigation_title_edit_profile_ch = "編輯個人資料"
var navigation_title_edit_profile_sp = "Editar perfil "

var navigation_title_edit_details_en = "Edit personal information"
var navigation_title_edit_details_ch = "編輯個人資料"
var navigation_title_edit_details_sp = "editar información personal"

var text_about_en = "About"
var text_about_ch = "有關醫生資料"
var text_about_sp = " acerca de "

var text_field_name_placeholder_en = "Name"
var text_field_email_placeholder_en = "Email"
var text_field_phone_placeholder_en = "Phone"
var text_field_password_placeholder_en = "Password"

var text_field_name_placeholder_ch = "名字"
var text_field_email_placeholder_ch = "電子郵件地址"
var text_field_phone_placeholder_ch = "電話"
var text_field_password_placeholder_ch = "密碼"

var text_field_name_placeholder_sp = "nombre "
var text_field_email_placeholder_sp = "correo electrónico "
var text_field_phone_placeholder_sp = "teléfono "
var text_field_password_placeholder_sp = "contraseña "

var text_create_an_account_en = "Create your account"
var text_create_an_account_ch = "建立你的帳戶"
var text_create_an_account_sp = "Crea tu cuenta "

var text_already_have_an_account_en = "Already have an account"
var text_already_have_an_account_ch = "已經在帳號 - 請登入"
var text_already_have_an_account_sp = " Ya tienes una cuenta"

var button_text_create_an_account_en = "Create an account"
var button_text_create_an_account_ch = "建立帳號"
var button_text_create_an_account_sp = "Crea una cuenta "

var button_text_update_an_account_en = "Update"
var button_text_update_an_account_ch = "更新"
var button_text_update_an_account_sp = " actualizar"

// complete profile
var navigation_title_complete_profile_en = "Complete profile"
var navigation_title_complete_profile_ch = "填寫個人資料"
var navigation_title_complete_profile_sp = " perfil completo "

var text_field_complete_address_placeholder_en = "Complete address"
var text_field_area_zip_code_placeholder_en = "Area Zipcode"
var text_field_working_hours_placeholder_en = "Working Hours start"
var text_field_year_of_exp_placeholder_en = "Year of Experience"
var text_field_specialization_placeholder_en = "Specialization"
var text_field_working_hour_end_placeholder_en = "Working hours end"
var text_field_gender_placeholder_en = "Gender"
var text_field_weight_placeholder_en = "Weight"
var text_field_blood_group_placeholder_en = "Blood group"

var text_field_complete_address_placeholder_ch = "填寫地址"
var text_field_area_zip_code_placeholder_ch = "郵遞區號"
var text_field_working_hours_placeholder_ch = "工作時間 (開始/開門）"
var text_field_year_of_exp_placeholder_ch = "經驗"
var text_field_specialization_placeholder_ch = "專業放射學"
var text_field_working_hour_end_placeholder_ch = "工作時間 (结束/關門"
var text_field_gender_placeholder_ch = "性別"
var text_field_weight_placeholder_ch = "體重"
var text_field_blood_group_placeholder_ch = "血型"

var text_field_complete_address_placeholder_sp = "completa tu direccion "
var text_field_area_zip_code_placeholder_sp = " código postal del área "
var text_field_working_hours_placeholder_sp = " hora de trabajo "
var text_field_year_of_exp_placeholder_sp = " año de experiencia "
var text_field_specialization_placeholder_sp = " especialización "
var text_field_working_hour_end_placeholder_sp = "fin de jornada laboral "
var text_field_gender_placeholder_sp = "género "
var text_field_weight_placeholder_sp = "peso "
var text_field_blood_group_placeholder_sp = " grupo sanguíneo "

var button_text_finish_en = "Finish"
var button_text_finish_ch = "完全"
var button_text_finish_sp = " finalizar "

// region
var navigation_title_region_en = "Region"
var navigation_title_region_ch = "病痛地方"
var navigation_title_region_sp = " región"

var text_what_is_pain_located_en = "Where is pain located, does it radiate anywhere"
var text_what_is_pain_located_ch = "病痛地方，是不是有擴散到其他地方"
var text_what_is_pain_located_sp = "Dónde se encuentra el dolor, Irradia en alguna parte "

var text_is_there_any_pain_en = "is there pain anywhere other than the site of stimulus"
var text_is_there_any_pain_ch = "除了刺激部位之外還有其他地方疼痛嗎"
var text_is_there_any_pain_sp = " Hay dolor en otro lugar que no sea el sitio del estímulo "

// journal
var navigation_title_journal_en = "Journal"
var navigation_title_journal_ch = "個人健康日誌"
var navigation_title_journal_sp = "diario "

// dashboard
var navigation_title_dashboard_en = "Dashboard"
var navigation_title_dashboard_ch = "儀表板"
var navigation_title_dashboard_sp = "panel"

var navigation_title_nearby_doctors_en = "Nearby Doctors"
var navigation_title_nearby_doctors_ch = "附近的醫生"
var navigation_title_nearby_doctors_sp = " Doctor cercano "

var text_translate_en = "Translate"
var text_translate_ch = "翻譯"
var text_translate_sp = " traducir "

var text_password_en = "Password"
var text_password_ch = "密碼"
var text_password_sp = " contraseña"

var text_hep_en = "Help"
var text_hep_ch = "輔助說明"
var text_hep_sp = " Ayuda "

var text_journal_en = "Journal"
var text_journal_ch = "日誌記錄"
var text_journal_sp = "diario"

var text_search_doctor_en = "Search Doctor"
var text_search_doctor_ch = "醫生搜尋"
var text_search_doctor_sp = " Buscar doctor"

var text_add_journal_en = "Add Journal"
var text_add_journal_ch = "加上日誌記錄"
var text_add_journal_sp = " agregar diario"


var text_logout_en = "Logout"
var text_logout_ch = " 登出"
var text_logout_sp = " cerrar sesión  "

// translate language
var navigation_title_translate_language_en = "Translate language"
var navigation_title_translate_language_ch = "翻譯 語言"
var navigation_title_translate_language_sp = " Traducir idioma"

var button_text_en = "Translate".uppercased()
var button_text_ch = "翻譯".uppercased()
var button_text_sp = "Traducir ".uppercased()

var text_translate_up_en = "Native Language: English"
var text_translate_up_ch = "母語:英文"
var text_translate_up_sp = " Lengua materna: Inglés "

var text_translate_down_en = "Selective Language: Chinese"
var text_translate_down_ch = "可選擇語言:中文"
var text_translate_down_sp = "lenguaje selectivo:Chino  "

/*var text_translate_down_en = "Selective Language: Spanish"
var text_translate_down_ch = "可選擇語言:西班牙語"
var text_translate_down_sp = "lenguaje selectivo:español"*/

var text_translate2_up_en = "Selective Language: English"//"Native Language: Chinese"
var text_translate2_up_ch = "母語:中文"
var text_translate2_up_sp = " lenguaje selectivo: inglés"//"Lengua materna: Chino"

var text_translate2_down_en = "Selective Language: English"
var text_translate2_down_ch = "可選擇語言:英文"
var text_translate2_down_sp = " lenguaje selectivo: inglés"

/*var text_translate2_down_en = "Selective Language: Spanish"
var text_translate2_down_ch = "可選擇語言: 西班牙語"
var text_translate2_down_sp = " lenguaje selectivo: español"*/

var text_translate3_up_en = "Native Language: Spanish"
var text_translate3_up_ch = "母語:西班牙語"
var text_translate3_up_sp = "Lengua materna:español"

var text_translate3_down_en = "Selective Language: English"
var text_translate3_down_ch = "可選擇語言:英文"
var text_translate3_down_sp = " lenguaje selectivo: inglés"

/*var text_translate3_down_en = "Selective Language: Chinese"
var text_translate3_down_ch = "可選擇語言:中文 "
var text_translate3_down_sp = " lenguaje selectivo: español"*/

// dashboard
var navigation_title_change_password_en = "Change Password"
var navigation_title_change_password_ch = "密碼更改"
var navigation_title_change_password_sp = " cambiar la contraseña "

var text_field_old_password_placeholder_en = "Old Password"
var text_field_new_password_placeholder_en = "New Password"
var text_field_confirm_password_placeholder_en = "Confirm Password"
var text_field_otp_placeholder_en = "OTP"

var text_field_old_password_placeholder_ch = "舊密碼"
var text_field_new_password_placeholder_ch = "新密碼"
var text_field_confirm_password_placeholder_ch = "確定密碼"
var text_field_otp_placeholder_ch = "奧特普"

var text_field_old_password_placeholder_sp = " Contraseña anterior "
var text_field_new_password_placeholder_sp = " Nueva contraseña "
var text_field_confirm_password_placeholder_sp = " confirmar Contraseña "
var text_field_otp_placeholder_sp = " OTP "

var button_text_change_password_en = "Change Password"
var button_text_change_password_ch = "密碼更改"
var button_text_change_password_sp = " cambiar la contraseña "

// common
var button_text_continue_en = "Continue"
var button_text_continue_ch = "請繼續"
var button_text_continue_sp = " continuar"

var text_please_wait_en = "please wait..."
var text_please_wait_ch = "請稍待一下"
var text_please_wait_sp = "espere por favor "

var text_updating_en = "updating..."
var text_updating_ch = "更新"
var text_updating_sp = " actualizando "

var text_dismiss_en = "Dismiss"
var text_dismiss_ch = "解除"
var text_dismiss_sp = " despedir "

var text_success_en = "Success"
var text_success_ch = "成功"
var text_success_sp = " éxito "

var text_translating_en = "Translating"
var text_translating_ch = "翻譯"
var text_translating_sp = " traductorio "

var text_upload_en = "Upload profile picture"
var text_upload_ch = "更新個人資料照片"
var text_upload_sp = " Subir foto de perfil "

var text_camera_en = "Camera"
var text_camera_ch = "相機"
var text_camera_sp = " cámara "

var text_gallery_en = "Gallery"
var text_gallery_ch = "資料庫"
var text_gallery_sp = " galería "

var text_are_you_sure_logout_en = "Are you sure you want to logout?"
var text_are_you_sure_logout_ch = "請確定你要登出"
var text_are_you_sure_logout_sp = " Estás seguro de que quieres cerrar sesión? "

// health journal
var navigation_title_add_health_general_en = "add health journal".uppercased()
var navigation_title_add_health_general_ch = "加上健康日誌".uppercased()
var navigation_title_add_health_general_sp = " agregar diario de salud ".uppercased()

var text_blood_pressure_en = "Blood Pressure"
var text_blood_pressure_ch = "血壓"
var text_blood_pressure_sp = " presión arterial "

var text_weight_en = "Weight"
var text_weight_ch = "體重"
var text_weight_sp = " peso "

var text_minute_of_excercise_en = "Exercise Duration"
var text_minute_of_excercise_ch = "運動時間"
var text_minute_of_excercise_sp = " duración del ejercicio "

var text_notable_events_en = "Event type"
var text_notable_events_ch = "Event type"
var text_notable_events_sp = " tipo de evento "

var text_pain_en = "Pain"
var text_pain_ch = "身體不舒服"
var text_pain_sp = " dolor "

var text_diff_breathing_en = "Difficult breathing/moving"
var text_diff_breathing_ch = "呼吸困難，身體移動困難等"
var text_diff_breathing_sp = " respiración difícil / Moviente "

var text_male_en = "Male"
var text_male_ch = "男性"
var text_male_sp = " masculino "

var text_female_en = "Female"
var text_female_ch = "女性"
var text_female_sp = " femenino"

// onset
var navigation_title_onset_en = "onset".uppercased()
var navigation_title_onset_ch = "發作".uppercased()
var navigation_title_onset_sp =  " comienz ".uppercased()

var text_what_were_you_doing_en = "What were you doing when this event began"
var text_what_were_you_doing_ch = "你有做什麼去減輕痛苦"
var text_what_were_you_doing_sp = " Qué estabas haciendo cuando comenzó este evento?"

var text_describe_en = "Please describe"
var text_describe_ch = "請描述"
var text_describe_sp = " por favor describa "

var button_skip_en = "skip".uppercased()
var button_skip_ch = "請跳過".uppercased()
var button_skip_sp = " saltar ".uppercased()


var text_constant_options_en = "Please describe"
var text_constant_options_ch = "請描述"
var text_constant_options_sp = " por favor describa "

var text_dull_option_dull_en = "Dull"
var text_dull_option_dull_ch = "身體沒反應"
var text_dull_option_dull_sp = " aburrido "

var text_dull_option_sharp_en = "Sharp"
var text_dull_option_sharp_ch = "身體劇痛"
var text_dull_option_sharp_sp = " afilado "

var text_dull_option_pressure_en = "Pressure"
var text_dull_option_pressure_ch = "身體壓力指數"
var text_dull_option_pressure_sp = " presión "

var text_dull_option_throbing_en = "Throbing"
var text_dull_option_throbing_ch = "身體悸動"
var text_dull_option_throbing_sp = " palpitante "

var text_dull_option_burning_en = "Burning"
var text_dull_option_burning_ch = "身體灼熱"
var text_dull_option_burning_sp = " incendio "

var text_dull_option_other_en = "Other"
var text_dull_option_other_ch = "其他"
var text_dull_option_other_sp = " otro "

var text_constant_option_constant_en = "Constant"
var text_constant_option_constant_ch = "持續"
var text_constant_option_constant_sp = " constante "

var text_constant_option_intermittent_en = "Intermittent"
var text_constant_option_intermittent_ch = "間歇性"
var text_constant_option_intermittent_sp = " intermitente "

var text_constant_option_other_en = "Other"
var text_constant_option_other_ch = "其他"
var text_constant_option_other_sp = " otro "

// provocation
var navigation_title_provocation_en = "Provocation".uppercased()
var navigation_title_provocation_ch = "病痛加重".uppercased()
var navigation_title_provocation_sp = "provocación ".uppercased()

var text_prov_message_en = "Is there anything that makes it better or worse (moving / medication)"
var text_prov_message_ch = "做什麼去減輕或加重病痛 (身體移動/ 藥物)"
var text_prov_message_sp = " Hay algo que lo haga mejor o peor (moviente/ medicamento)"

// quality
var navigation_title_quality_en = "Quality".uppercased()
var navigation_title_quality_ch = "身體狀況".uppercased()
var navigation_title_quality_sp = " calidad ".uppercased()

var text_describe_pain_en = "Describe pain"
var text_describe_pain_ch = "描述病痛程度"
var text_describe_pain_sp = " describir el dolor "

var text_dull_en = "Dull"
var text_dull_ch = "身體反應"
var text_dull_sp = " aburrido "

var text_constant_en = "Constant"
var text_constant_ch = "恆量 "
var text_constant_sp = " constante "

// severity
var navigation_title_severity_en = "Severity".uppercased()
var navigation_title_severity_ch = "嚴重度".uppercased()
var navigation_title_severity_sp = " gravedad".uppercased()

var text_how_sever_en = "How severe on a scale of 1-10"
var text_how_sever_ch = "嚴重的程度 1-10 分數"
var text_how_sever_sp = " Que severo en una escala de 1-10 "

var text_field_please_select_en = "Please select"
var text_field_please_select_ch = "請選項"
var text_field_please_select_sp = " por favor seleccione "

// timings
var navigation_title_timings_en = "Timing".uppercased()
var navigation_title_timings_ch = "時間".uppercased()
var navigation_title_timings_sp = " momento ".uppercased()

var text_what_time_event_start_en = "What time did event start, How long did it last, has it happened before "
var text_what_time_event_start_ch = "什麼時候開始不舒服, 它持續多久, 它以前有發生過嗎"
var text_what_time_event_start_sp = " A qué hora comenzó el evento, Cuánto duró, ha sucedido antes"

// actions
var navigation_title_actions_en = "Actions".uppercased()
var navigation_title_actions_ch = "採取措施".uppercased()
var navigation_title_actions_sp = " comportamiento ".uppercased()

var text_what_action_if_any_en = "What actions if any did you take"
var text_what_action_if_any_ch = "你有做什麼措施"
var text_what_action_if_any_sp = " Qué acciones, si es que alguna, tomaste "

var text_action_medication_en = "Medication"
var text_action_medication_ch = "藥物"
var text_action_medication_sp = " medicamento "

var text_action_ice_en = "Ice"
var text_action_ice_ch = "冰敷"
var text_action_ice_sp = " hielo "

var text_action_change_activity_food_en = "Change in activity"
var text_action_change_activity_food_ch = "改變作息"
var text_action_change_activity_food_sp = " cambio de actividad "

var text_action_water_intake_en = "Food/Water Intake"
var text_action_water_intake_ch = "食物和飲水的習慣"
var text_action_water_intake_sp = " alimento/agua consumo "

// DOCTOS CATEGORY
var text_doctor_details_name_en = "Name"
var text_doctor_details_name_ch = "姓名"
var text_doctor_details_name_sp = " nombre "

var text_doctor_details_phone_number_en = "Phone number"
var text_doctor_details_phone_number_ch = "電話號碼"
var text_doctor_details_phone_number_sp = " número de teléfono "

var text_doctor_details_address_en = "Address"
var text_doctor_details_address_ch = "地址 "
var text_doctor_details_address_sp = " DIRECCIÓN "

var text_doctor_details_website_en = "Website"
var text_doctor_details_website_ch = "網站"
var text_doctor_details_website_sp = " sitio web "

var text_doctor_details_rating_en = "Rating"
var text_doctor_details_rating_ch = "評分"
var text_doctor_details_rating_sp = " clasificación "

var text_doctor_details_days_and_timings_en = "Days and Timings"
var text_doctor_details_days_and_timings_ch = "日期 和時間"
var text_doctor_details_days_and_timings_sp = " días y tiempos"

var text_doctor_details_photos_en = "Photos"
var text_doctor_details_photos_ch = "照片"
var text_doctor_details_photos_sp = " fotos "

var text_doctor_details_open_en = "Open"
var text_doctor_details_open_ch = "開門時間"
var text_doctor_details_open_sp = " abierto "

var text_doctor_details_close_en = "Close"
var text_doctor_details_close_ch = "關門時間"
var text_doctor_details_close_sp = " cerca "


var text_doctor_Pediatrician_en = "Pediatrician"
var text_doctor_Pediatrician_ch = "小兒科醫生"
var text_doctor_Pediatrician_sp = " pediatra "

var text_doctor_Cardiologist_en = "Cardiologist"
var text_doctor_Cardiologist_ch = "心臟科醫生"
var text_doctor_Cardiologist_sp = " cardiólogo"

var text_doctor_Endocrinologist_en = "Endocrinologist"
var text_doctor_Endocrinologist_ch = "內分泌科醫生"
var text_doctor_Endocrinologist_sp = " endocrinólogo "

var text_doctor_Gynecologist_en = "Gynecologist"
var text_doctor_Gynecologist_ch = "婦產科醫生"
var text_doctor_Gynecologist_sp = " Ginecólogo "

var text_doctor_Neurologist_en = "Neurologist"
var text_doctor_Neurologist_ch = "神經科醫生"
var text_doctor_Neurologist_sp = "  neurólogo  "

var text_doctor_Psychiatrist_en = "Psychiatrist"
var text_doctor_Psychiatrist_ch = "精神科醫生"
var text_doctor_Psychiatrist_sp = " psiquiatra "

var text_doctor_Dermatologist_en = "Dermatologist"
var text_doctor_Dermatologist_ch = "皮膚科醫生"
var text_doctor_Dermatologist_sp = " Dermatólogo "

var text_doctor_Oncologist_en = "Oncologist"
var text_doctor_Oncologist_ch = "腫瘤科醫生"
var text_doctor_Oncologist_sp = " oncólogo "

var text_doctor_Physicians_en = "Physicians"
var text_doctor_Physicians_ch = "一般醫生"
var text_doctor_Physicians_sp = " médicos "

var text_doctor_Otolaryngologist_en = "Otolaryngologist"
var text_doctor_Otolaryngologist_ch = "耳鼻喉科醫生"
var text_doctor_Otolaryngologist_sp = " otorrinolaringólogo "

var text_doctor_Radiologist_en = "Radiologist"
var text_doctor_Radiologist_ch = "放射科醫生"
var text_doctor_Radiologist_sp = " radiólogo"

var text_doctor_Emergency_Medicine_en = "Emergency Medicine"
var text_doctor_Emergency_Medicine_ch = "急診室醫生"
var text_doctor_Emergency_Medicine_sp = " Medicina de emergencia"

var text_doctor_Gastroenterologist_en = "Gastroenterologist"
var text_doctor_Gastroenterologist_ch = "胃腸科醫生"
var text_doctor_Gastroenterologist_sp = " Gastroenterólogo "

var text_doctor_Ophthalmologist_en = "Ophthalmologist"
var text_doctor_Ophthalmologist_ch = "眼科醫生"
var text_doctor_Ophthalmologist_sp = " Oftalmólogo "

var text_doctor_Orthopedist_en = "Orthopedist"
var text_doctor_Orthopedist_ch = "骨科醫生"
var text_doctor_Orthopedist_sp = " Ortopedista "


var text_doctor_Pulmonologist_en = "Pulmonologist"
var text_doctor_Pulmonologist_ch = "肺科醫生"
var text_doctor_Pulmonologist_sp = " neumólogo  "

var text_doctor_Allergist_en = "Allergist"
var text_doctor_Allergist_ch = "過敏科醫生"
var text_doctor_Allergist_sp = "  alergólogo "

var text_doctor_Internists_en = "Internists"
var text_doctor_Internists_ch = "內科醫生"
var text_doctor_Internists_sp = " internistas "

var text_doctor_Nephrologist_en = "Nephrologist"
var text_doctor_Nephrologist_ch = "腎臟科醫生"
var text_doctor_Nephrologist_sp = " Nefrólogo "

var text_doctor_Dentist_en = "Dentist"
var text_doctor_Dentist_ch = "牙醫"
var text_doctor_Dentist_sp = " Dentista "

var text_doctor_Geriatrician_en = "Geriatrician"
var text_doctor_Geriatrician_ch = "老年科醫生"
var text_doctor_Geriatrician_sp = " Geriatra  "


var text_doctor_Epidemiologist_en = "Epidemiologist"
var text_doctor_Epidemiologist_ch = "流行病科醫生"
var text_doctor_Epidemiologist_sp = " Epidemiólogo "

var text_doctor_Podiatrist_en = "Podiatrist"
var text_doctor_Podiatrist_ch = "足科醫生"
var text_doctor_Podiatrist_sp = " Diatra  "

var text_doctor_Surgeon_en = "Surgeon"
var text_doctor_Surgeon_ch = "外科手術醫生"
var text_doctor_Surgeon_sp = " cirujano "




class text_language: UIViewController {
    
    
    class func selected_language_get()->String {
        
        var str_language_prefrence_is:String!
        
        if let language_is = UserDefaults.standard.string(forKey: default_key_language) {
            print(language_is)
            if (language_is == english_language) {
                str_language_prefrence_is = english_language
            } else if (language_is == chinese_language) {
                str_language_prefrence_is = chinese_language
            } else {
                str_language_prefrence_is = spanish_language
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
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_please_wait_ch
            } else {
                str_language_prefrence_is = text_please_wait_sp
            }
            
        } else  if (status == "updating") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_updating_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_updating_ch
            } else {
                str_language_prefrence_is = text_updating_sp
            }
            
        }  else  if (status == "dismiss") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_dismiss_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_dismiss_ch
            } else {
                str_language_prefrence_is = text_dismiss_sp
            }
            
        }   else  if (status == "success") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_success_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_success_ch
            } else {
                str_language_prefrence_is = text_success_sp
            }
            
        } else  if (status == "translating") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_translating_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_translating_ch
            } else {
                str_language_prefrence_is = text_translating_sp
            }
            
        }  else  if (status == "upload_profile_picture") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_upload_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_upload_ch
            } else {
                str_language_prefrence_is = text_upload_sp
            }
            
        }  else  if (status == "camera") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_camera_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_camera_ch
            } else {
                str_language_prefrence_is = text_camera_sp
            }
            
        }  else  if (status == "gallery") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_gallery_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_gallery_ch
            } else {
                str_language_prefrence_is = text_gallery_sp
            }
            
        } else  if (status == "logout_message") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_are_you_sure_logout_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_are_you_sure_logout_ch
            } else {
                str_language_prefrence_is = text_are_you_sure_logout_sp
            }
            
        } else  if (status == "pain") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_pain_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_pain_ch
            } else {
                str_language_prefrence_is = text_pain_sp
            }
            
        } else  if (status == "diff_breathing") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_diff_breathing_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_diff_breathing_ch
            } else {
                str_language_prefrence_is = text_diff_breathing_sp
            }
            
        }
        else  if (status == "male") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_male_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_male_ch
            } else {
                str_language_prefrence_is = text_male_sp
            }
            
        }else  if (status == "female") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_female_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_female_ch
            } else {
                str_language_prefrence_is = text_female_sp
            }
            
        }else  if (status == "gender") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_gender_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_gender_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_gender_placeholder_sp
            }
            
        } else  if (status == "please_describe") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_describe_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_describe_ch
            } else {
                str_language_prefrence_is = text_describe_sp
            }
            
        } else  if (status == "dull_option_dull") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_dull_option_dull_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_dull_option_dull_ch
            } else {
                str_language_prefrence_is = text_dull_option_dull_sp
            }
            
        }else  if (status == "dull_option_sharp") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_dull_option_sharp_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_dull_option_sharp_ch
            } else {
                str_language_prefrence_is = text_dull_option_sharp_sp
            }
            
        }else  if (status == "dull_option_pressure") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_dull_option_pressure_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_dull_option_pressure_ch
            } else {
                str_language_prefrence_is = text_dull_option_pressure_sp
            }
            
        }else  if (status == "dull_option_throbing") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_dull_option_throbing_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_dull_option_throbing_ch
            } else {
                str_language_prefrence_is = text_dull_option_throbing_sp
            }
            
        }else  if (status == "dull_option_burning") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_dull_option_burning_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_dull_option_burning_ch
            } else {
                str_language_prefrence_is = text_dull_option_burning_sp
            }
            
        }else  if (status == "dull_option_other") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_dull_option_other_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_dull_option_other_ch
            } else {
                str_language_prefrence_is = text_dull_option_other_sp
            }
            
        } else  if (status == "constant_option_constant") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_constant_option_constant_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_constant_option_constant_ch
            } else {
                str_language_prefrence_is = text_constant_option_constant_sp
            }
            
        }else  if (status == "constant_option_intermittent") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_constant_option_intermittent_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_constant_option_intermittent_ch
            } else {
                str_language_prefrence_is = text_constant_option_intermittent_sp
            }
            
        } else  if (status == "constant_option_other") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_constant_option_other_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_constant_option_other_ch
            } else {
                str_language_prefrence_is = text_constant_option_other_sp
            }
            
        } else  if (status == "add_journal") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_add_journal_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_add_journal_ch
            } else {
                str_language_prefrence_is = button_add_journal_sp
            }
            
        } else  if (status == "done") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_done_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_done_ch
            } else {
                str_language_prefrence_is = button_done_sp
            }
            
        } else  if (status == "about_doctor") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_about_doctor_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_about_doctor_ch
            } else {
                str_language_prefrence_is = text_about_doctor_sp
            }
            
        } else  if (status == "install_whatsapp") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_please_install_whatsapp_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_please_install_whatsapp_ch
            } else {
                str_language_prefrence_is = text_please_install_whatsapp_sp
            }
            
        } else  if (status == "enable_location") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_enable_your_location_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_enable_your_location_ch
            } else {
                str_language_prefrence_is = text_enable_your_location_sp
            }
            
        }
        else  if (status == "alert") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_alert_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_alert_ch
           } else {
               str_language_prefrence_is = text_alert_sp
           }
           
       } 
        else  if (status == "forgot_password") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_forgot_password_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_forgot_password_ch
           } else {
               str_language_prefrence_is = text_forgot_password_sp
           }
           
       }else  if (status == "delete_account_message") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_delete_account_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_delete_account_ch
           } else {
               str_language_prefrence_is = text_delete_account_sp
           }
           
       }else  if (status == "delete") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_delete_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_delete_ch
           } else {
               str_language_prefrence_is = text_delete_sp
           }
           
       }
        
        
        
        return str_language_prefrence_is
        
    }
    
    
    // doctors details
    class func doctors_details_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        //
        if (status == "#01") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_name_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_name_ch
           } else {
               str_language_prefrence_is = text_doctor_details_name_sp
           }
           
       } else  if (status == "#02") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_phone_number_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_phone_number_ch
           } else {
               str_language_prefrence_is = text_doctor_details_phone_number_sp
           }
           
       } else  if (status == "#03") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_address_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_address_ch
           } else {
               str_language_prefrence_is = text_doctor_details_address_sp
           }
           
       } else  if (status == "#04") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_website_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_website_ch
           } else {
               str_language_prefrence_is = text_doctor_details_website_sp
           }
           
       } else  if (status == "#05") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_rating_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_rating_ch
           } else {
               str_language_prefrence_is = text_doctor_details_rating_sp
           }
           
       } else  if (status == "#06") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_days_and_timings_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_days_and_timings_ch
           } else {
               str_language_prefrence_is = text_doctor_details_days_and_timings_sp
           }
           
       } else  if (status == "#07") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_photos_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_photos_ch
           } else {
               str_language_prefrence_is = text_doctor_details_photos_sp
           }
           
       }  else  if (status == "#08") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_photos_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_photos_ch
           } else {
               str_language_prefrence_is = text_doctor_details_photos_sp
           }
           
       }  else  if (status == "#09") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_open_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_open_ch
           } else {
               str_language_prefrence_is = text_doctor_details_open_sp
           }
           
       }  else  if (status == "#10") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_details_close_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_details_close_ch
           } else {
               str_language_prefrence_is = text_doctor_details_close_sp
           }
           
       }
        return str_language_prefrence_is
        
    }
    
    
    
    // doctors
    class func doctors_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        //
        if (status == "Pediatrician") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Pediatrician_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Pediatrician_ch
           } else {
               str_language_prefrence_is = text_doctor_Pediatrician_sp
           }
            
       }
        else  if (status == "Cardiologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Cardiologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Cardiologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Cardiologist_sp
           }
           
       }
        else  if (status == "Endocrinologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Endocrinologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Endocrinologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Endocrinologist_sp
           }
           
       }
        
        
        
        
        else  if (status == "Gynecologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Gynecologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Gynecologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Gynecologist_sp
           }
           
       }
        else  if (status == "Neurologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Neurologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Neurologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Neurologist_sp
           }
           
       }
        else  if (status == "Psychiatrist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Psychiatrist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Psychiatrist_ch
           } else {
               str_language_prefrence_is = text_doctor_Psychiatrist_sp
           }
           
       }
        
        
        
        
        else  if (status == "Dermatologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Dermatologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Dermatologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Dermatologist_sp
           }
           
       }
        else  if (status == "Oncologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Oncologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Oncologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Oncologist_sp
           }
           
       }
        else  if (status == "Physicians") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Physicians_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Physicians_ch
           } else {
               str_language_prefrence_is = text_doctor_Physicians_sp
           }
           
       }
        
        
        
        
        
        
        
        else  if (status == "Otolaryngologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Otolaryngologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Otolaryngologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Otolaryngologist_sp
           }
           
       }
        else  if (status == "Radiologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Radiologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Radiologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Radiologist_sp
           }
           
       }
        else  if (status == "Emergency Medicine") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Emergency_Medicine_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Emergency_Medicine_ch
           } else {
               str_language_prefrence_is = text_doctor_Emergency_Medicine_sp
           }
           
       }
        
        
        
        
        
        
        else  if (status == "Gastroenterologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Gastroenterologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Gastroenterologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Gastroenterologist_sp
           }
           
       }
        else  if (status == "Ophthalmologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Ophthalmologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Ophthalmologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Ophthalmologist_sp
           }
           
       }
        else  if (status == "Orthopedist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Orthopedist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Orthopedist_ch
           } else {
               str_language_prefrence_is = text_doctor_Orthopedist_sp
           }
           
       }
        
        
        
        
        
        else  if (status == "Pulmonologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Pulmonologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Pulmonologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Pulmonologist_sp
           }
           
       }
        else  if (status == "Allergist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Allergist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Allergist_ch
           } else {
               str_language_prefrence_is = text_doctor_Allergist_sp
           }
           
       }
        else  if (status == "Internists") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Internists_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Internists_ch
           } else {
               str_language_prefrence_is = text_doctor_Internists_sp
           }
           
       }
        
        
        
        
        
        
        else  if (status == "Nephrologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Nephrologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Nephrologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Nephrologist_sp
           }
           
       }
        else  if (status == "Dentist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Dentist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Dentist_ch
           } else {
               str_language_prefrence_is = text_doctor_Dentist_sp
           }
           
       }
        else  if (status == "Geriatrician") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Geriatrician_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Geriatrician_ch
           } else {
               str_language_prefrence_is = text_doctor_Geriatrician_sp
           }
           
       }
        
        
        
        
        else  if (status == "Epidemiologist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Epidemiologist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Epidemiologist_ch
           } else {
               str_language_prefrence_is = text_doctor_Epidemiologist_sp
           }
           
       }
        else  if (status == "Podiatrist") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Podiatrist_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Podiatrist_ch
           } else {
               str_language_prefrence_is = text_doctor_Podiatrist_sp
           }
           
       }
        else  if (status == "Surgeon") {
           if (text_language.selected_language_get() == english_language) {
               str_language_prefrence_is = text_doctor_Surgeon_en
           } else if (text_language.selected_language_get() == chinese_language) {
               str_language_prefrence_is = text_doctor_Surgeon_ch
           } else {
               str_language_prefrence_is = text_doctor_Surgeon_sp
           }
           
       }
     
        return str_language_prefrence_is
        
    }
        
        
        
        
        
        
        
    // timings
    class func actions_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_actions_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_actions_ch
            } else {
                str_language_prefrence_is = navigation_title_actions_sp
            }
        } else  if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_what_action_if_any_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_what_action_if_any_ch
            } else {
                str_language_prefrence_is = text_what_action_if_any_sp
            }
        } else  if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_action_medication_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_action_medication_ch
            } else {
                str_language_prefrence_is = text_action_medication_sp
            }
        }
        else  if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_action_ice_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_action_ice_ch
            } else {
                str_language_prefrence_is = text_action_ice_sp
            }
        }
        else  if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_action_change_activity_food_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_action_change_activity_food_ch
            } else {
                str_language_prefrence_is = text_action_change_activity_food_sp
            }
        }
        else  if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_action_water_intake_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_action_water_intake_ch
            } else {
                str_language_prefrence_is = text_action_water_intake_sp
            }
        }
        
        return str_language_prefrence_is
    }
    
    // timings
    class func timings_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_timings_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_timings_ch
            } else {
                str_language_prefrence_is = navigation_title_timings_sp
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_what_time_event_start_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_what_time_event_start_ch
            } else {
                str_language_prefrence_is = text_what_time_event_start_sp
            }
        }
        
        
        return str_language_prefrence_is
    }
    
    // severity
    class func severity_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_severity_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_severity_ch
            } else {
                str_language_prefrence_is = navigation_title_severity_sp
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_how_sever_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_how_sever_ch
            } else {
                str_language_prefrence_is = text_how_sever_sp
            }
        } else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_please_select_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_please_select_ch
            } else {
                str_language_prefrence_is = text_field_please_select_sp
            }
        }
        return str_language_prefrence_is
    }
    
    
    
    // region
    class func region_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_region_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_region_ch
            } else {
                str_language_prefrence_is = navigation_title_region_sp
            }
        } else  if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_what_is_pain_located_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_what_is_pain_located_ch
            } else {
                str_language_prefrence_is = text_what_is_pain_located_sp
            }
        }
         else  if (status == "#03") {
             if (text_language.selected_language_get() == english_language) {
                 str_language_prefrence_is = text_is_there_any_pain_en
             } else if (text_language.selected_language_get() == chinese_language) {
                 str_language_prefrence_is = text_is_there_any_pain_ch
             } else {
                 str_language_prefrence_is = text_is_there_any_pain_sp
             }
         }
        
        
        return str_language_prefrence_is

    }
    
    // describe pain
    class func quality_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_quality_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_quality_ch
            } else {
                str_language_prefrence_is = navigation_title_quality_sp
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_describe_pain_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_describe_pain_ch
            } else {
                str_language_prefrence_is = text_describe_pain_sp
            }
        } else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_dull_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_dull_ch
            } else {
                str_language_prefrence_is = text_dull_sp
            }
        } else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_constant_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_constant_ch
            } else {
                str_language_prefrence_is = text_constant_sp
            }
        }
         
        
        return str_language_prefrence_is
    }
    
    // provocation
    class func provocation_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_provocation_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_provocation_ch
            } else {
                str_language_prefrence_is = navigation_title_provocation_sp
            }
        }
        else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_prov_message_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_prov_message_ch
            } else {
                str_language_prefrence_is = text_prov_message_sp
            }
        }
        
        return str_language_prefrence_is
    }
    
    // onset
    class func on_set_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_onset_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_onset_ch
            } else {
                str_language_prefrence_is = navigation_title_onset_sp
            }
        }
        else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_describe_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_describe_ch
            } else {
                str_language_prefrence_is = text_describe_sp
            }
        }else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_what_were_you_doing_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_what_were_you_doing_ch
            } else {
                str_language_prefrence_is = text_what_were_you_doing_sp
            }
        } else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_skip_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_skip_ch
            } else {
                str_language_prefrence_is = button_skip_sp
            }
        }
        
        return str_language_prefrence_is
    }
    
    // ADD JOURNAL
    class func add_health_journal_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_add_health_general_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_add_health_general_ch
            } else {
                str_language_prefrence_is = navigation_title_add_health_general_sp
            }
        } else
        if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_blood_pressure_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_blood_pressure_ch
            } else {
                str_language_prefrence_is = text_blood_pressure_sp
            }
        } else
        if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_weight_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_weight_ch
            } else {
                str_language_prefrence_is = text_weight_sp
            }
        } else
        if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_minute_of_excercise_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_minute_of_excercise_ch
            } else {
                str_language_prefrence_is = text_minute_of_excercise_sp
            }
        } else
        if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_notable_events_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_notable_events_ch
            } else {
                str_language_prefrence_is = text_notable_events_sp
            }
        } else
        if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_continue_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_continue_ch
            } else {
                str_language_prefrence_is = button_continue_sp
            }
        }
        
        return str_language_prefrence_is
    }
    
    
    // help
    class func help_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_help_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_help_ch
            } else {
                str_language_prefrence_is = navigation_title_help_sp
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_connect_with_us_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_connect_with_us_ch
            } else {
                str_language_prefrence_is = text_connect_with_us_sp
            }
        }  else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_whatsapp_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_whatsapp_ch
            } else {
                str_language_prefrence_is = text_whatsapp_sp
            }
        }   else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_support_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_support_ch
            } else {
                str_language_prefrence_is = text_support_sp
            }
        }    else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_all_rights_reserved_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_all_rights_reserved_ch
            } else {
                str_language_prefrence_is = text_all_rights_reserved_sp
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
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_login_ch
            } else {
                str_language_prefrence_is = navigation_title_login_sp
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_login_message_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_login_message_ch
            } else {
                str_language_prefrence_is = text_login_message_sp
            }
        } else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_continue_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_continue_ch
            } else {
                str_language_prefrence_is = button_continue_sp
            }
        }else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_email_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_email_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_email_placeholder_sp
            }
        }else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_password_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_password_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_password_placeholder_sp
            }
        } else if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_register_now_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_register_now_ch
            } else {
                str_language_prefrence_is = button_register_now_sp
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
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_welcome_ch
            } else {
                str_language_prefrence_is = navigation_title_welcome_sp
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = select_language_text_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = select_language_text_ch
            } else {
                str_language_prefrence_is = select_language_text_sp
            }
        } else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_doctor_continue_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_text_doctor_continue_ch
            } else {
                str_language_prefrence_is = button_text_doctor_continue_sp
            }
        } else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_patient_continue_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_text_patient_continue_ch
            } else {
                str_language_prefrence_is = button_text_patient_continue_sp
            }
        } else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_login_text_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_login_text_ch
            } else {
                str_language_prefrence_is = navigation_title_login_text_sp
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
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_create_an_account_ch
            } else {
                str_language_prefrence_is = navigation_title_create_an_account_sp
            }
        } else  if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_create_an_account_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_create_an_account_ch
            } else {
                str_language_prefrence_is = text_create_an_account_sp
            }
        } else  if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_create_an_account_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_text_create_an_account_ch
            } else {
                str_language_prefrence_is = button_text_create_an_account_sp
            }
        } else  if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_name_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_name_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_name_placeholder_sp
            }
        } else  if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_email_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_email_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_email_placeholder_sp
            }
        } else  if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_phone_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_phone_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_phone_placeholder_sp
            }
        }  else  if (status == "#07") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_password_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_password_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_password_placeholder_sp
            }
        }  else  if (status == "#08") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_already_have_an_account_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_already_have_an_account_ch
            } else {
                str_language_prefrence_is = text_already_have_an_account_sp
            }
        }   else  if (status == "#09") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_update_an_account_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_text_update_an_account_ch
            }  else {
                str_language_prefrence_is = button_text_update_an_account_sp
            }
        }    else  if (status == "#10") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_edit_profile_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_edit_profile_ch
            } else {
                str_language_prefrence_is = navigation_title_edit_profile_sp
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
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_complete_profile_ch
            } else {
                str_language_prefrence_is = navigation_title_complete_profile_sp
            }
        }
        else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_complete_address_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_complete_address_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_complete_address_placeholder_sp
            }
        }
        else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_area_zip_code_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_area_zip_code_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_area_zip_code_placeholder_sp
            }
        }
        else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_working_hours_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_working_hours_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_working_hours_placeholder_sp
            }
        }
        else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_year_of_exp_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_year_of_exp_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_year_of_exp_placeholder_sp
            }
        }
        else if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_specialization_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_specialization_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_specialization_placeholder_sp
            }
        }
        else if (status == "#07") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_finish_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_text_finish_ch
            } else {
                str_language_prefrence_is = button_text_finish_sp
            }
        } else if (status == "#08") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_working_hour_end_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_working_hour_end_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_working_hour_end_placeholder_sp
            }
        }
        else if (status == "#09") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_gender_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_gender_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_gender_placeholder_sp
            }
        }
        else if (status == "#10") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_weight_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_weight_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_weight_placeholder_sp
            }
        }
        else if (status == "#11") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_blood_group_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_blood_group_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_blood_group_placeholder_sp
            }
        }
        else if (status == "#12") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_update_an_account_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_text_update_an_account_ch
            } else {
                str_language_prefrence_is = button_text_update_an_account_sp
            }
        } else if (status == "#14") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_edit_details_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_edit_details_ch
            } else {
                str_language_prefrence_is = navigation_title_edit_details_sp
            }
        } else if (status == "#15") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_about_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_about_ch
            } else {
                str_language_prefrence_is = text_about_sp
            }
        }
        
        
        return str_language_prefrence_is
        
    }
    
    // journal
    class func all_journal_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_journal_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_journal_ch
            } else {
                str_language_prefrence_is = navigation_title_journal_sp
            }
        }
        
        return str_language_prefrence_is
    }
    
    // dashboard
    class func nearby_doctors_screen(status:String)->String {
        
        var str_language_prefrence_is:String! = "0"
        
        print(status)
        print(text_language.selected_language_get())
        
        if (status == "#01") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = navigation_title_nearby_doctors_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_nearby_doctors_ch
                
                
            } else {
                str_language_prefrence_is = navigation_title_nearby_doctors_sp
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
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_dashboard_ch
            } else {
                str_language_prefrence_is = navigation_title_dashboard_sp
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_translate_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_translate_ch
            } else {
                str_language_prefrence_is = text_translate_sp
            }
        } else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_password_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_password_ch
            } else {
                str_language_prefrence_is = text_password_sp
            }
        } else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_hep_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_hep_ch
            } else {
                str_language_prefrence_is = text_hep_sp
            }
        }
        
        else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_journal_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_journal_ch
            } else {
                str_language_prefrence_is = text_journal_sp
            }
        }
        else if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_search_doctor_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_search_doctor_ch
            } else {
                str_language_prefrence_is = text_search_doctor_sp
            }
        }
        else if (status == "#07") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_add_journal_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_add_journal_ch
            } else {
                str_language_prefrence_is = text_add_journal_sp
            }
        }
        else if (status == "#08") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_logout_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_logout_ch
            } else {
                str_language_prefrence_is = text_logout_sp
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
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_translate_language_ch
            } else {
                str_language_prefrence_is = navigation_title_translate_language_sp
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_text_ch
            } else {
                str_language_prefrence_is = button_text_sp
            }
        }  else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_translate_up_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_translate_up_ch
            } else {
                str_language_prefrence_is = text_translate_up_sp
            }
        }  else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_translate_down_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_translate_down_ch
            } else {
                str_language_prefrence_is = text_translate_down_sp
            }
        }
        
        else if (status == "#05") {
          if (text_language.selected_language_get() == english_language) {
              str_language_prefrence_is = text_translate2_up_en
          } else if (text_language.selected_language_get() == chinese_language) {
              str_language_prefrence_is = text_translate2_up_ch
          } else {
              str_language_prefrence_is = text_translate2_up_sp
          }
      }
        else if (status == "#06") {
          if (text_language.selected_language_get() == english_language) {
              str_language_prefrence_is = text_translate2_down_en
          } else if (text_language.selected_language_get() == chinese_language) {
              str_language_prefrence_is = text_translate2_down_ch
          } else {
              str_language_prefrence_is = text_translate3_up_sp
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
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = navigation_title_change_password_ch
            } else {
                str_language_prefrence_is = navigation_title_change_password_sp
            }
        } else if (status == "#02") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_old_password_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_old_password_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_old_password_placeholder_sp
            }
        }else if (status == "#03") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_new_password_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_new_password_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_new_password_placeholder_sp
            }
        }else if (status == "#04") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_confirm_password_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_confirm_password_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_confirm_password_placeholder_sp
            }
        } else if (status == "#05") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = button_text_change_password_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = button_text_change_password_ch
            } else {
                str_language_prefrence_is = button_text_change_password_sp
            }
        }else if (status == "#06") {
            if (text_language.selected_language_get() == english_language) {
                str_language_prefrence_is = text_field_otp_placeholder_en
            } else if (text_language.selected_language_get() == chinese_language) {
                str_language_prefrence_is = text_field_otp_placeholder_ch
            } else {
                str_language_prefrence_is = text_field_otp_placeholder_sp
            }
        }
        
        return str_language_prefrence_is
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}
