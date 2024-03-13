//
//  create_an_account.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit
import Alamofire

class create_an_account: UIViewController {

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
    
    @IBOutlet weak var tble_view:UITableView! {
        didSet {
            tble_view.backgroundColor = app_bg_color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
    }
    
    @objc func continue_click_method2() {
        Utils.light_vibrate()
        
        self.create_an_account()
    }
    
    @objc func create_an_account() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! create_an_account_table_cell
        
        if (cell.txt_name.text == "") {
            return
        }
        if (cell.txt_email.text == "") {
            return
        }
        if (cell.txt_phone.text == "") {
            return
        }
        if (cell.txt_password.text == "") {
            return
        }
        
        var parameters:Dictionary<AnyHashable, Any>!
        
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
        
        parameters = [
            "action"        : "registration",
            "fullName"      : String(cell.txt_name.text!),
            "email"         : String(cell.txt_email.text!),
            "contactNumber" : String(cell.txt_phone.text!),
            "password"      : String(cell.txt_password.text!),
            "role"          : String("Doctor"),
            "device"        : String("iOS")
        ]
        
        
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
                        ERProgressHud.sharedInstance.hide()
                        
                        var dict: Dictionary<AnyHashable, Any>
                        dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                        
                        let defaults = UserDefaults.standard
                        defaults.setValue(dict, forKey: str_save_login_user_data)
                        
                        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "complete_profile_id")
                        self.navigationController?.pushViewController(push, animated: true)
                        
                        
                    }
                    else {
                        // self.login_refresh_token_wb()
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
}

//MARK:- TABLE VIEW -
extension create_an_account: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:create_an_account_table_cell = tableView.dequeueReusableCell(withIdentifier: "create_an_account_table_cell") as! create_an_account_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        cell.lbl_create_account_text.text = text_language.create_an_account_screen(status: "#02")
        cell.btn_continue.setTitle(text_language.create_an_account_screen(status: "#03"), for: .normal)
        
        // self.convert_language()
        self.lbl_navigation_title.text = text_language.create_an_account_screen(status: "#01")
        
        cell.txt_name.placeholder = text_language.create_an_account_screen(status: "#04")
        cell.txt_email.placeholder = text_language.create_an_account_screen(status: "#05")
        cell.txt_phone.placeholder = text_language.create_an_account_screen(status: "#06")
        cell.txt_password.placeholder = text_language.create_an_account_screen(status: "#07")
        
        cell.lbl_already_have_an_account.text = text_language.create_an_account_screen(status: "#08")
        
        cell.btn_continue.addTarget(self, action: #selector(continue_click_method2), for: .touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 620
    }

}
