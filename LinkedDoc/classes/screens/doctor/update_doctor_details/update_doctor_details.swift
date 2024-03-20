//
//  update_doctor_details.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 14/03/24.
//

import UIKit
import Alamofire

class update_doctor_details: UIViewController {
    
    var str_token:String! = ""
    
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
            btn_back.isHidden = false
        }
    }
    
    @IBOutlet weak var tble_view:UITableView! {
        didSet {
            tble_view.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        self.view.backgroundColor = app_bg_color
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
    }
    
    @objc func finish_click_method() {
        self.complete_profile_account_WB()
        
    }
    
    
    @objc func complete_profile_account_WB() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! update_doctor_details_table_cell
        
        if (cell.txt_complete_address.text == "") {
            return
        }
        if (cell.txt_area_zipcode.text == "") {
            return
        }
        if (cell.txt_working_hours.text == "") {
            return
        }
        if (cell.txt_year_of_experience.text == "") {
            return
        }
        if (cell.txt_complete_address.text == "") {
            return
        }
        if (cell.txt_view.text == "") {
            return
        }
        self.view.endEditing(true)
        var parameters:Dictionary<AnyHashable, Any>!
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            let x : Int = person["userId"] as! Int
            let myString = String(x)
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                
                let headers: HTTPHeaders = [
                    "token":String(token_id_is),
                ]
                
                parameters = [
                    "action"        : "editprofile",
                    "userId"        : String(myString),
                    "address"       : String(cell.txt_complete_address.text!),
                    "zipcode"       : String(cell.txt_area_zipcode.text!),
                    "wokingHours"       : String(cell.txt_working_hours.text!)+" - "+String(cell.txt_working_hours_end.text!),
                    "yearOfExperience"       : String(cell.txt_year_of_experience.text!),
                    "specialization"       : String(cell.txt_specialization.text!),
                    "about"       : String(cell.txt_view.text!),
                ]
                
                print("parameters-------\(String(describing: parameters))")
                
                AF.request(application_base_url, method: .post, parameters: parameters as? Parameters, headers: headers).responseJSON {
                    response in
                    
                    switch(response.result) {
                    case .success(_):
                        if let data = response.value {
                            
                            let JSON = data as! NSDictionary
                            print(JSON)
                            
                            var strSuccess : String!
                            strSuccess = JSON["status"] as? String
                            
                            if strSuccess.lowercased() == "success" {
                                ERProgressHud.sharedInstance.hide()
                                
                                var dict: Dictionary<AnyHashable, Any>
                                dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                                
                                let defaults = UserDefaults.standard
                                defaults.setValue(dict, forKey: str_save_login_user_data)
                                
                                if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
                                    print(person as Any)
                                    
                                    if person["role"] as! String == "Doctor" {
                                        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "dashboard_id")
                                        self.navigationController?.pushViewController(push, animated: true)
                                    } else {
                                        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "patient_dashboard_id")
                                        self.navigationController?.pushViewController(push, animated: true)
                                    }
                                    
                                }
                                
                            }
                            else {
                                self.generate_token()
                            }
                            
                        }
                        
                    case .failure(_):
                        print("Error message:\(String(describing: response.error))")
                        ERProgressHud.sharedInstance.hide()
                        self.please_check_your_internet_connection()
                        
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
                        
                        self.complete_profile_account_WB()
                        
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
    
    
    
    @objc func start_time_click_method() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! update_doctor_details_table_cell
        RPicker.selectDate(title: "Select Time", cancelText: "Cancel", datePickerMode: .time, didSelectDate: { (selectedDate) in
            cell.txt_working_hours.text = selectedDate.dateString("hh:mm a")
             
            
        })
    }
    
    @objc func end_time_click_method() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! update_doctor_details_table_cell
        RPicker.selectDate(title: "Select Time", cancelText: "Cancel", datePickerMode: .time, didSelectDate: { (selectedDate) in
            cell.txt_working_hours_end.text = selectedDate.dateString("hh:mm a")
             
            
        })
        
    }
}

//MARK:- TABLE VIEW -
extension update_doctor_details: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:update_doctor_details_table_cell = tableView.dequeueReusableCell(withIdentifier: "update_doctor_details_table_cell") as! update_doctor_details_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        self.lbl_navigation_title.text = text_language.complete_profile_screen(status: "#01")
        
        cell.txt_complete_address.placeholder = text_language.complete_profile_screen(status: "#02")
        cell.txt_area_zipcode.placeholder = text_language.complete_profile_screen(status: "#03")
        cell.txt_working_hours.placeholder = text_language.complete_profile_screen(status: "#04")
        cell.txt_year_of_experience.placeholder = text_language.complete_profile_screen(status: "#05")
        cell.txt_specialization.placeholder = text_language.complete_profile_screen(status: "#06")
        cell.txt_working_hours_end.placeholder = text_language.complete_profile_screen(status: "#08")
        
        cell.lbl_about_us.text =  text_language.common_screen(status: "about_doctor")
        
        cell.btn_finish.setTitle(text_language.complete_profile_screen(status: "#07"), for: .normal)
        
        cell.btn_finish.addTarget(self, action: #selector(finish_click_method), for: .touchUpInside)
        
        cell.btn_start_time.addTarget(self, action: #selector(start_time_click_method), for: .touchUpInside)
        cell.btn_end_time.addTarget(self, action: #selector(end_time_click_method), for: .touchUpInside)
        
        /*
         @IBOutlet weak var lbl_address:UILabel!
         @IBOutlet weak var lbl_zipcode:UILabel!
         @IBOutlet weak var lbl_working_hr_start:UILabel!
         @IBOutlet weak var lbl_working_hr_end:UILabel!
         @IBOutlet weak var lbl_year_of_experience:UILabel!
         @IBOutlet weak var lbl_specialization:UILabel!
         @IBOutlet weak var lbl_about_us:UILabel!
         */
        cell.lbl_address.text = text_language.complete_profile_screen(status: "#02")
        cell.lbl_zipcode.text = text_language.complete_profile_screen(status: "#03")
        cell.lbl_working_hr_start.text = text_language.complete_profile_screen(status: "#04")
        cell.lbl_working_hr_end.text = text_language.complete_profile_screen(status: "#08")
        cell.lbl_year_of_experience.text = text_language.complete_profile_screen(status: "#05")
        cell.lbl_specialization.text = text_language.complete_profile_screen(status: "#06")
        cell.lbl_about_us.text = text_language.complete_profile_screen(status: "#15")
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
        
            cell.txt_complete_address.text = (person["address"] as! String)
            cell.txt_area_zipcode.text = (person["zipcode"] as! String)
            cell.txt_working_hours.text = (person["wokingHours"] as! String)
            cell.txt_year_of_experience.text = "\(person["yearOfExperience"]!)"
            cell.txt_specialization.text = (person["specialization"] as! String)
            cell.txt_working_hours_end.text = (person["wokingHours"] as! String)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1400
    }

}
