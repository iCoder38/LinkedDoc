//
//  actions.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 15/03/24.
//

import UIKit
import Alamofire

class actions: UIViewController {
    
    var str_server_value:String! = ""
    
    var str_add_journal_bp:String!
    var str_add_journal_weight:String!
    var str_add_journal_minute_of_excercise:String!
    var str_add_journal_notable_events:String!
    
    var str_onset:String!
    
    var str_provocation:String!
    
    var str_dull:String!
    var str_constant:String!
    
    var str_where:String!
    var str_is:String!
    
    var str_severity:String!
    
    var str_timing:String!
    
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
        }
    }
    
    @IBOutlet weak var lbl_message:UILabel!
    @IBOutlet weak var lbl_pd1:UILabel!
    
    @IBOutlet weak var btn_continue:UIButton! {
        didSet {
            btn_continue.backgroundColor = button_light_blue_color
            btn_continue.layer.cornerRadius = 12
            btn_continue.clipsToBounds = true
            btn_continue.setTitleColor(.white, for: .normal)
        }
    }
    @IBOutlet weak var btn_skip:UIButton!
    
    @IBOutlet weak var txt_medication:UITextField! {
        didSet {
            txt_medication.layer.cornerRadius = 12
            txt_medication.clipsToBounds = true
            txt_medication.backgroundColor = text_field_BG_color
            txt_medication.placeholder = "Medication"
            txt_medication.setLeftPaddingPoints(20)
        }
    }
    
    @IBOutlet weak var btn_medication:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        self.lbl_navigation_title.text = text_language.actions_screen(status: "#01")
        self.lbl_pd1.text = text_language.actions_screen(status: "#02")
        
        self.txt_medication.placeholder = text_language.actions_screen(status: "#03")
        self.btn_medication.addTarget(self, action: #selector(actions_method), for: .touchUpInside)
        
        // get from other's screen
        self.btn_continue.setTitle(text_language.common_screen(status: "add_journal"), for: .normal)
        
        self.btn_continue.addTarget(self, action: #selector(manage_all_data_to_send_server), for: .touchUpInside)
        self.btn_skip.addTarget(self, action: #selector(manage_all_data_to_send_server), for: .touchUpInside)
    }
    
    @objc func actions_method() {
        
        let dummyList = [
            text_language.actions_screen(status: "#03"),
            text_language.actions_screen(status: "#04"),
            text_language.actions_screen(status: "#05"),
            text_language.actions_screen(status: "#06"),
        ]
        
        RPicker.selectOption(title: text_language.actions_screen(status: "#03"), cancelText: text_language.common_screen(status: "dismiss"), dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
            
            if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                print(language_select as Any)
                
                if (language_select == "en") {
                    self.txt_medication.text = String(selctedText)
                    self.str_server_value = String(selctedText)
                } else {
                    if String(selctedText) == "藥物" { // medication
                        self.str_server_value = "Medication"
                    } else if String(selctedText) == "冰敷" { // ice
                        self.str_server_value = "Ice"
                    } else if String(selctedText) == "改變作息" { // change activity
                        self.str_server_value = "Change activity"
                    } else if String(selctedText) == "食物和飲水的習慣" { // food / water intake
                        self.str_server_value = "Food / Water Intake"
                    }
                    self.txt_medication.text = String(selctedText)
                }
            }
            print(self.str_server_value as Any)
        }
    }
    
    
    @objc func manage_all_data_to_send_server() {
        print("CLICKED")
        
        /*
         var str_add_journal_bp:String!
         var str_add_journal_weight:String!
         var str_add_journal_minute_of_excercise:String!
         var str_add_journal_notable_events:String!
         */
        if let data_add_journal = UserDefaults.standard.value(forKey: "key_save_add_health_journal") as? [String:Any] {
            print(data_add_journal as Any)
            
            self.str_add_journal_bp = (data_add_journal["BP"] as! String)
            self.str_add_journal_weight = (data_add_journal["weight"] as! String)
            self.str_add_journal_minute_of_excercise = (data_add_journal["exercise_time"] as! String)
            self.str_add_journal_notable_events = (data_add_journal["notable_event"] as! String)
            
        } else {
            self.str_add_journal_bp = ""
            self.str_add_journal_weight = ""
            self.str_add_journal_minute_of_excercise = ""
            self.str_add_journal_notable_events = ""
        }
        /*print(self.str_add_journal_bp as Any)
        print(self.str_add_journal_weight as Any)
        print(self.str_add_journal_minute_of_excercise as Any)
        print(self.str_add_journal_notable_events as Any)*/
        
        // #2 ONSET
        if let data_onset = UserDefaults.standard.value(forKey: "key_save_onset") as? [String:Any] {
            // print(data_onset as Any)
            
            self.str_onset = (data_onset["onset"] as! String)
        } else {
            self.str_onset = ""
        }
        print(self.str_onset as Any)
        
        
        // #3 PROVOCATION
        if let data_provocation = UserDefaults.standard.value(forKey: "key_save_provocation") as? [String:Any] {
            // print(data_provocation as Any)
            
            self.str_provocation = (data_provocation["provocation"] as! String)
        } else {
            self.str_provocation = ""
        }
        print(self.str_provocation as Any)
        
        
        // #4 QUALITY
        if let data_quality = UserDefaults.standard.value(forKey: "key_save_quality") as? [String:Any] {
            // print(data_provocation as Any)
            
            self.str_dull = (data_quality["dull"] as! String)
            self.str_constant = (data_quality["constant"] as! String)
            
        } else {
            self.str_dull = ""
            self.str_constant = ""
        }
        print(self.str_dull as Any)
        print(self.str_constant as Any)
        
        
        
        // #5 REGION
        if let data_region = UserDefaults.standard.value(forKey: "key_save_region") as? [String:Any] {
            // print(data_provocation as Any)
            
            self.str_where = (data_region["view_one"] as! String)
            self.str_is = (data_region["view_two"] as! String)
            
        } else {
            self.str_where = ""
            self.str_is = ""
        }
        print(self.str_where as Any)
        print(self.str_is as Any)
        
        
        
        // #6 severity
        if let data_severity = UserDefaults.standard.value(forKey: "key_save_severity") as? [String:Any] {
            // print(data_provocation as Any)
            
            self.str_severity = (data_severity["severity"] as! String)
            
        } else {
            self.str_severity = ""
        }
        print(self.str_severity as Any)
        
        
        
        // #7 timing
        if let data_timing = UserDefaults.standard.value(forKey: "key_save_timing") as? [String:Any] {
            // print(data_provocation as Any)
            
            self.str_timing = (data_timing["timing"] as! String)
            
        } else {
            self.str_timing = ""
        }
        print(self.str_timing as Any)
        
        self.send_data_to_server()
    }
    
    @objc func send_data_to_server() {
        /*if (self.txt_medication.text!) == "" {
            return
        }*/
        self.send_now_WB()
    }
    
    @objc func send_now_WB() {
        
        self.view.endEditing(true)
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]
                
                let urlString = application_base_url
                var parameters:Dictionary<AnyHashable, Any>!
                
                parameters = [
                    "action"        :   "recordadd",
                    "userId"        :   String(myString),
                    "BP"            : String(self.str_add_journal_bp),
                    "weight"        : String(self.str_add_journal_weight),
                    "exercise_time" : String(self.str_add_journal_minute_of_excercise),
                    "notable_event" : String(self.str_add_journal_notable_events),
                    
                    "event_description":String(self.str_onset),
                    
                    "event_extra"   :String(self.str_provocation),
                    
                    "describe_plan_1":String(self.str_dull),
                    "describe_plan_2":String(self.str_constant),
                    
                    "location":String(self.str_where),
                    "stimulus":String(self.str_is),
                    
                    "scale":String(self.str_severity),
                    "about_event":String(self.str_timing),
                    "event_action":String(self.str_server_value),
                    
                    "Date_time"     :Date.get_current_date_and_time()
                ]
                
                
                print("parameters-------\(String(describing: parameters))")
                
                AF.request(urlString, method: .post, parameters: parameters as? Parameters, headers: headers).responseJSON {
                    response in
                    
                    switch(response.result) {
                    case .success(_):
                        if let data = response.value {
                            
                            let JSON = data as! NSDictionary
                            print(JSON)
                            
                            var strSuccess : String!
                            strSuccess = (JSON["status"]as Any as? String)?.lowercased()
                            
                            var strSuccess2 : String!
                            strSuccess2 = JSON["msg"]as Any as? String
                            
                            if strSuccess == "success" {
                                ERProgressHud.sharedInstance.hide()
                                
                                self.clear_all_default_values()
                                
                                if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                    print(language_select as Any)
                                    
                                    if (language_select == "en") {
                                        let alert = NewYorkAlertController(title: text_language.common_screen(status: "success"), message: (JSON["msg"] as! String), style: .alert)
                                        let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel){
                                            _ in
                                            let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "patient_dashboard_id")
                                            self.navigationController?.pushViewController(push, animated: true)
                                        }
                                        alert.addButtons([cancel])
                                        self.present(alert, animated: true)
                                        self.success_message(message: (JSON["msg"] as! String))
                                    } else {
                                        let alert = NewYorkAlertController(title: text_language.common_screen(status: "success"), message: (JSON["msg_ch"] as! String), style: .alert)
                                        let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel){
                                            _ in
                                            let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "patient_dashboard_id")
                                            self.navigationController?.pushViewController(push, animated: true)
                                        }
                                        alert.addButtons([cancel])
                                        self.present(alert, animated: true)
                                        self.success_message(message: (JSON["msg_ch"] as! String))
                                    }
                                    
                                }
                                
                                 
                            }
                            //
                            if (strSuccess2 == your_are_not_auth) {
                                self.generate_token()
                            } else {
                                ERProgressHud.sharedInstance.hide()
                                
                                if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                    print(language_select as Any)
                                    if (language_select == "en") {
                                        
                                        self.view.makeToast(String(strSuccess2))
                                        
                                    } else {
                                        
                                        self.view.makeToast(JSON["msg_ch"] as? String)
                                        
                                    }
                                }
                                
                            }
                            
                        }
                        
                        
                    case .failure(_):
                        print("Error message:\(String(describing: response.error))")
                        ERProgressHud.sharedInstance.hide()
                        
                        
                        break
                    }
                }
            } else {
                self.generate_token()
            }
        }
    }
    
    
    @objc func generate_token() {
        
        var parameters:Dictionary<AnyHashable, Any>!
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            parameters = [
                "action"    : "gettoken",
                "userId"    : String(myString),
                "email"     : (person["email"] as! String),
                "role"      : (person["role"] as! String)
            ]
        }
        
        print("parameters-------\(String(describing: parameters))")
        
        AF.request(application_base_url, method: .post, parameters: parameters as? Parameters).responseJSON {
            response in
            
            switch(response.result) {
            case .success(_):
                if let data = response.value {
                    
                    let JSON = data as! NSDictionary
                    print(JSON)
                    
                    var strSuccess : String!
                    strSuccess = JSON["status"] as? String
                    
                    if strSuccess.lowercased() == "success" {
                        
                        let str_token = (JSON["AuthToken"] as! String)
                        UserDefaults.standard.set("", forKey: str_save_last_api_token)
                        UserDefaults.standard.set(str_token, forKey: str_save_last_api_token)
                        
                        self.send_now_WB()
                        
                    } else {
                        ERProgressHud.sharedInstance.hide()
                    }
                    
                }
                
            case .failure(_):
                print("Error message:\(String(describing: response.error))")
                ERProgressHud.sharedInstance.hide()
                self.please_check_your_internet_connection()
                
                break
            }
        }
    }
    
    func clear_all_default_values() {
        // clear all default value
        UserDefaults.standard.set(nil, forKey: "key_save_add_health_journal")
        UserDefaults.standard.set(nil, forKey: "key_save_onset")
        UserDefaults.standard.set(nil, forKey: "key_save_provocation")
        UserDefaults.standard.set(nil, forKey: "key_save_quality")
        UserDefaults.standard.set(nil, forKey: "key_save_region")
        UserDefaults.standard.set(nil, forKey: "key_save_severity")
        UserDefaults.standard.set(nil, forKey: "key_save_timing")
    }
    
}


/*
 action:recordadd
 userId:
 BP:
 weight:
 exercise_time:
 notable_event:
 
 event_description: onset
 
 event_extra: provocation
 
 describe_plan_1: dull
 describe_plan_2: constant
 
 location: region up box
 stimulus: region down box
 
 scale: severity
 
 about_event: timing
 
 event_action: medication
 
 */
