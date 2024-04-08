//
//  MenuControllerVC.swift
//  SidebarMenu
//
//  Created by Apple  on 16/10/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class MenuControllerVC: UIViewController {

    let cellReuseIdentifier = "menuControllerVCTableCell"
    
    var bgImage: UIImageView?
    
    var arr_menu_list_en = ["Dashboard",
                           "Edit Profile",
                            "Edit Details",
                           "Translate",
                            "Change Language",
                           "Change Password",
                           "Help",
                            "Delete account",
                           "Logout",
    ]
    
    var arr_menu_list_ch = ["儀表板",
                            "編輯個人資料",
                            "編輯個人資料",
                            "翻譯",
                            "更改你要用的語言",
                            "密碼更改",
                            "輔助說明",
                            "刪除帳戶",
                            "登出",
    ]
    
    var arrMenuItemImage = ["home",
                            "edit",
                            "edit",
                            "trip",
                            "translation",
                            "changePassword",
                            "help_w",
                            "delete",
                            "logout"
    ]
    
    @IBOutlet weak var viewNavigation:UIView! {
        didSet {
            viewNavigation.backgroundColor = navigation_color
        }
    }
    @IBOutlet weak var btnBack:UIButton!
    @IBOutlet weak var lblNavigationTitle:UILabel! {
        didSet {
            lblNavigationTitle.text = "NAVIGATION"
            lblNavigationTitle.textColor = .white
        }
    }
    
    @IBOutlet var menuButton:UIButton!
    
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblAddress:UILabel!
    
    @IBOutlet weak var img_profile:UIImageView! {
        didSet {
            img_profile.layer.cornerRadius = 45
            img_profile.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var tbleView: UITableView! {
        didSet {
            tbleView.delegate = self
            tbleView.dataSource = self
            tbleView.tableFooterView = UIView.init(frame: CGRect(origin: .zero, size: .zero))
            tbleView.backgroundColor = navigation_color
            // tbleView.separatorStyle = .none
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tbleView.separatorColor = .white
        sideBarMenuClick()
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            self.img_profile.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
            self.img_profile.sd_setImage(with: URL(string: (person["image"] as! String)), placeholderImage: UIImage(named: "avatar"))
            
            self.lblName.text       = (person["fullName"] as! String)
            self.lblAddress.text    = (person["address"] as! String)
        }
        
        self.tbleView.reloadData()
    }
    
    @objc func convert_language() {
        
    }
    
    @objc func sideBarMenuClick() {
        if revealViewController() != nil {
            menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            
            revealViewController().rearViewRevealWidth = 300
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
       
    @objc func delete_account_WB() {
        
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
                    "action"        :   "userdelete",
                    "userId"        :   String(myString),
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
                            strSuccess = JSON["status"]as Any as? String
                            
                            var strSuccess2 : String!
                            strSuccess2 = JSON["msg"]as Any as? String
                            
                            if strSuccess == "success" {
                                ERProgressHud.sharedInstance.hide()
                                if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                    print(language_select as Any)
                                    
                                    UserDefaults.standard.set(nil, forKey: str_save_login_user_data)
                                    UserDefaults.standard.set(nil, forKey: default_key_language)
                                    
                                    let obj = self.storyboard?.instantiateViewController(withIdentifier: "select_language_id") as! select_language
                                    let navController = UINavigationController(rootViewController: obj)
                                    navController.setViewControllers([obj], animated:true)
                                    self.revealViewController().setFront(navController, animated: true)
                                    self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
                                    
                                }
                                 
                            } else {
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
                        
                        self.delete_account_WB()
                        
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
    
    
    
}

extension MenuControllerVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
            print(language_select as Any)
            if (language_select == "en") {
                return self.arr_menu_list_en.count
            } else {
                return self.arr_menu_list_ch.count
            }
            
        }
        
        return self.arr_menu_list_en.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuControllerVCTableCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MenuControllerVCTableCell
        
        cell.backgroundColor = .clear
        
        
        if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
            print(language_select as Any)
            if (language_select == "en") {
                cell.lblName.text = self.arr_menu_list_en[indexPath.row]
            } else {
                cell.lblName.text = self.arr_menu_list_ch[indexPath.row]
            }
        }
        
        
        cell.lblName.textColor = .white
        cell.imgProfile.image = UIImage(named: self.arrMenuItemImage[indexPath.row])
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if String(arr_menu_list_en[indexPath.row]) == "Dashboard" {
            pushPageNumber(strMyPageNumber: "1")
        }
        if String(arr_menu_list_en[indexPath.row]) == "Edit Profile" {
            pushPageNumber(strMyPageNumber: "2")
        }
        if String(arr_menu_list_en[indexPath.row]) == "Translate" {
            pushPageNumber(strMyPageNumber: "3")
        }
        if String(arr_menu_list_en[indexPath.row]) == "Change Language" {
            pushPageNumber(strMyPageNumber: "4")
        }
        if String(arr_menu_list_en[indexPath.row]) == "Change Password" {
            pushPageNumber(strMyPageNumber: "5")
        }
        if String(arr_menu_list_en[indexPath.row]) == "Logout" {
            pushPageNumber(strMyPageNumber: "6")
        }
        if String(arr_menu_list_en[indexPath.row]) == "Help" {
            pushPageNumber(strMyPageNumber: "7")
        }
        if String(arr_menu_list_en[indexPath.row]) == "Edit Details" {
            pushPageNumber(strMyPageNumber: "8")
        }
        if String(arr_menu_list_en[indexPath.row]) == "Delete account" {
            pushPageNumber(strMyPageNumber: "9")
        }
    }
    
    @objc func pushPageNumber(strMyPageNumber:String) {
        
        if strMyPageNumber == "3" {
            
            // let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "translate_language_id")
            // self.navigationController?.pushViewController(push, animated: true)
            
            /*let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
            self.view.window?.rootViewController = sw
            let destinationController = storyboard.instantiateViewController(withIdentifier: "translate_language_id")
            let navigationController = UINavigationController(rootViewController: destinationController)
            sw.setFront(navigationController, animated: true)*/
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
            self.view.window?.rootViewController = sw
            let destinationController = storyboard.instantiateViewController(withIdentifier: "translate_language_id")
            let navigationController = UINavigationController(rootViewController: destinationController)
            sw.setFront(navigationController, animated: true)
            
        } else if strMyPageNumber == "1" {
            
            if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
                print(person)
                
                if (person["role"] as! String) == "Member" {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                    self.view.window?.rootViewController = sw
                    let destinationController = storyboard.instantiateViewController(withIdentifier: "patient_dashboard_id")
                    let navigationController = UINavigationController(rootViewController: destinationController)
                    sw.setFront(navigationController, animated: true)
                } else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                    self.view.window?.rootViewController = sw
                    let destinationController = storyboard.instantiateViewController(withIdentifier: "dashboard_id")
                    let navigationController = UINavigationController(rootViewController: destinationController)
                    sw.setFront(navigationController, animated: true)
                }
            }
            
            
        } else if strMyPageNumber == "2" {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
            self.view.window?.rootViewController = sw
            let destinationController = storyboard.instantiateViewController(withIdentifier: "update_profile_id")
            let navigationController = UINavigationController(rootViewController: destinationController)
            sw.setFront(navigationController, animated: true)
            
        } else if strMyPageNumber == "8" {
            
            if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
                print(person)
                
                if (person["role"] as! String) == "Member" {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                    self.view.window?.rootViewController = sw
                    let destinationController = storyboard.instantiateViewController(withIdentifier: "update_patient_details_id")
                    let navigationController = UINavigationController(rootViewController: destinationController)
                    sw.setFront(navigationController, animated: true)
                } else {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
                    self.view.window?.rootViewController = sw
                    let destinationController = storyboard.instantiateViewController(withIdentifier: "update_doctor_details_id")
                    let navigationController = UINavigationController(rootViewController: destinationController)
                    sw.setFront(navigationController, animated: true)
                }
                
            }
            
            
        } else if strMyPageNumber == "7" {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sw = storyboard.instantiateViewController(withIdentifier: "sw") as! SWRevealViewController
            self.view.window?.rootViewController = sw
            let destinationController = storyboard.instantiateViewController(withIdentifier: "help_id")
            let navigationController = UINavigationController(rootViewController: destinationController)
            sw.setFront(navigationController, animated: true)
            
        } else if strMyPageNumber == "4" {
            
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "update_select_language_id") as! update_select_language
            let navController = UINavigationController(rootViewController: obj)
            navController.setViewControllers([obj], animated:true)
            self.revealViewController().setFront(navController, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
            
        } else if strMyPageNumber == "5" {
            
            let obj = self.storyboard?.instantiateViewController(withIdentifier: "change_password_id") as! change_password
            let navController = UINavigationController(rootViewController: obj)
            navController.setViewControllers([obj], animated:true)
            self.revealViewController().setFront(navController, animated: true)
            self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
            
        } else if strMyPageNumber == "6" {
            
            
            let alert = NewYorkAlertController(title: text_language.common_screen(status: "alert"), message: text_language.common_screen(status: "logout_message"), style: .alert)
            let logout = NewYorkButton(title: text_language.dashboard_screen(status: "#08"), style: .default) {
                _ in
                
                UserDefaults.standard.set(nil, forKey: str_save_login_user_data)
                UserDefaults.standard.set(nil, forKey: default_key_language)
                
                let obj = self.storyboard?.instantiateViewController(withIdentifier: "select_language_id") as! select_language
                let navController = UINavigationController(rootViewController: obj)
                navController.setViewControllers([obj], animated:true)
                self.revealViewController().setFront(navController, animated: true)
                self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
                
            }
            
            let dismiss = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .default)
            
            alert.addButtons([logout,dismiss])
            self.present(alert, animated: true)
            
            
            
        }  else if strMyPageNumber == "9" {
            
            let alert = NewYorkAlertController(title: text_language.common_screen(status: "alert"), message: text_language.common_screen(status: "delete_account_message"), style: .alert)
            let logout = NewYorkButton(title: text_language.common_screen(status: "delete"), style: .default) {
                _ in
                
                self.delete_account_WB()
                
            }
            
            let dismiss = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .default)
            
            alert.addButtons([logout,dismiss])
            self.present(alert, animated: true)
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
        
    }
    
}

extension MenuControllerVC: UITableViewDelegate {
    
}
