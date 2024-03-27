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
                           "Logout",
    ]
    
    var arr_menu_list_ch = ["儀表板",
                           "編輯個人資料",
                            "編輯個人資料",
                           "翻譯",
                            "更改你要用的語言",
                           "密碼更改",
                           "輔助說明",
                           "登出",
    ]
    
    var arrMenuItemImage = ["home",
                            "edit",
                            "edit",
                            "trip",
                            "translation",
                            "changePassword",
                            "help_w",
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
        
        /*if  indexPath.row == 0 {
            let label = UILabel(frame: CGRect(x: 15, y: 10, width: 345, height: 30))
            label.textAlignment = .left
            if let person = UserDefaults.standard.value(forKey: "keyLoginFullData") as? [String:Any] {
                label.text = (person["fullName"] as! String)
            }
            
            label.textColor = .black
            label.font = UIFont.init(name: "OpenSans-Bold", size: 20)
            cell.addSubview(label)
            
            let image : UIImage = UIImage(named:"location")!
            bgImage = UIImageView(image: image)
            bgImage!.frame = CGRect(x: 15, y: 46, width: 20, height: 20)
            cell.addSubview(bgImage!)
            
            let label2 = UILabel(frame: CGRect(x: 44, y: 40, width: 311, height: 30))
            label2.textAlignment = .left
            if let person = UserDefaults.standard.value(forKey: "keyLoginFullData") as? [String:Any]
            {
                label2.text = (person["address"] as! String)
            }
            label2.textColor = .black
            cell.addSubview(label2)
            cell.backgroundColor = UIColor.init(red: 252.0/255.0, green: 195.0/255.0, blue: 10.0/255.0, alpha: 1)
        }
         if  indexPath.row == 1 {
            let mScreenSize = UIScreen.main.bounds
            let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
            let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
            mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
            cell.addSubview(mAddSeparator)
            
            let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
            bgImage = UIImageView(image: image)
            bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
            cell.addSubview(bgImage!)
            
            let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
            label.textAlignment = .left
            label.text = "Dashboard" // arrMenuItemList[indexPath.row]
            label.font = UIFont.init(name: "OpenSans-Light", size: 20)
            label.textColor = .white
            cell.addSubview(label)
            cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
        }
         if  indexPath.row == 2 {
            let mScreenSize = UIScreen.main.bounds
            let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
            let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
            mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
            cell.addSubview(mAddSeparator)
            
            let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
            bgImage = UIImageView(image: image)
            bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
            cell.addSubview(bgImage!)
            
            let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
            label.textAlignment = .left
            label.text =  "Edit Profile" // arrMenuItemList[indexPath.row]
            label.font = UIFont.init(name: "OpenSans-Light", size: 20)
            label.textColor = .white
            cell.addSubview(label)
            cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
        }
         if  indexPath.row == 3 {
            let mScreenSize = UIScreen.main.bounds
            let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
            let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
            mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
            cell.addSubview(mAddSeparator)
            
            let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
            bgImage = UIImageView(image: image)
            bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
            cell.addSubview(bgImage!)
            
            let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
            label.textAlignment = .left
            label.text = "My Post" //  arrMenuItemList[indexPath.row]
            label.font = UIFont.init(name: "OpenSans-Light", size: 20)
            label.textColor = .white
            cell.addSubview(label)
            cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
        }
             if  indexPath.row == 4 {
                let mScreenSize = UIScreen.main.bounds
                let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
                let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
                mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
                cell.addSubview(mAddSeparator)
                
                let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
                cell.addSubview(bgImage!)
                
                let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
                label.textAlignment = .left
                label.text = "Submit New Post" // arrMenuItemList[indexPath.row]
                label.font = UIFont.init(name: "OpenSans-Light", size: 20)
                label.textColor = .white
                cell.addSubview(label)
                cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
            }
             if  indexPath.row == 5 {
                let mScreenSize = UIScreen.main.bounds
                let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
                let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
                mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
                cell.addSubview(mAddSeparator)
                
                let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
                cell.addSubview(bgImage!)
                
                let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
                label.textAlignment = .left
                label.text = "Request Service" // arrMenuItemList[indexPath.row]
                label.font = UIFont.init(name: "OpenSans-Light", size: 20)
                label.textColor = .white
                cell.addSubview(label)
                cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
            }
             if  indexPath.row == 6 {
                let mScreenSize = UIScreen.main.bounds
                let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
                let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
                mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
                cell.addSubview(mAddSeparator)
                
                let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
                cell.addSubview(bgImage!)
                
                let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
                label.textAlignment = .left
                label.text = "Pet Store" // arrMenuItemList[indexPath.row]
                label.font = UIFont.init(name: "OpenSans-Light", size: 20)
                label.textColor = .white
                cell.addSubview(label)
                cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
            }
             if  indexPath.row == 7 {
                let mScreenSize = UIScreen.main.bounds
                let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
                let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
                mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
                cell.addSubview(mAddSeparator)
                
                let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
                cell.addSubview(bgImage!)
                
                let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
                label.textAlignment = .left
                label.text = "My Orders" // arrMenuItemList[indexPath.row]
                label.font = UIFont.init(name: "OpenSans-Light", size: 20)
                label.textColor = .white
                cell.addSubview(label)
                cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
            }
             if  indexPath.row == 8 {
                let mScreenSize = UIScreen.main.bounds
                let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
                let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
                mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
                cell.addSubview(mAddSeparator)
                
                let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
                cell.addSubview(bgImage!)
                
                let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
                label.textAlignment = .left
                label.text = "Appointment" // arrMenuItemList[indexPath.row]
                label.font = UIFont.init(name: "OpenSans-Light", size: 20)
                label.textColor = .white
                cell.addSubview(label)
                cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
            }
             if  indexPath.row == 9 {
                let mScreenSize = UIScreen.main.bounds
                let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
                let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
                mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
                cell.addSubview(mAddSeparator)
                
                let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
                cell.addSubview(bgImage!)
                
                let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
                label.textAlignment = .left
                label.text = "My Booking" // arrMenuItemList[indexPath.row]
                label.font = UIFont.init(name: "OpenSans-Light", size: 20)
                label.textColor = .white
                cell.addSubview(label)
                cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
            }
             if  indexPath.row == 10 {
                let mScreenSize = UIScreen.main.bounds
                let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
                let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
                mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
                cell.addSubview(mAddSeparator)
                
                let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
                cell.addSubview(bgImage!)
                
                let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
                label.textAlignment = .left
                label.text = "Change Password" // arrMenuItemList[indexPath.row]
                label.font = UIFont.init(name: "OpenSans-Light", size: 20)
                label.textColor = .white
                cell.addSubview(label)
                cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
            }
             if  indexPath.row == 11 {
                let mScreenSize = UIScreen.main.bounds
                let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
                let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
                mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
                cell.addSubview(mAddSeparator)
                
                let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
                bgImage = UIImageView(image: image)
                bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
                cell.addSubview(bgImage!)
                
                let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
                label.textAlignment = .left
                label.text = "Help" // arrMenuItemList[indexPath.row]
                label.font = UIFont.init(name: "OpenSans-Light", size: 20)
                label.textColor = .white
                cell.addSubview(label)
                cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
            }
         if  indexPath.row == 12 {
            let mScreenSize = UIScreen.main.bounds
            let mSeparatorHeight = CGFloat(0.5) // Change height of speatator as you want
            let mAddSeparator = UIView.init(frame: CGRect(x: 0, y: cell.frame.size.height - mSeparatorHeight, width: mScreenSize.width, height: mSeparatorHeight))
            mAddSeparator.backgroundColor = UIColor.white // Change backgroundColor of separator
            cell.addSubview(mAddSeparator)
            
            let image : UIImage = UIImage(named:arrMenuItemImage[indexPath.row])!
            bgImage = UIImageView(image: image)
            bgImage!.frame = CGRect(x: 20, y: 10, width: 30, height: 30)
            cell.addSubview(bgImage!)
            
            let label = UILabel(frame: CGRect(x: 60, y: 15, width: 302, height: 24))
            label.textAlignment = .left
            label.text = "Logout" // arrMenuItemList[indexPath.row]
            label.font = UIFont.init(name: "OpenSans-Light", size: 20)
            label.textColor = .white
            cell.addSubview(label)
            cell.backgroundColor = UIColor.init(red: 8.0/255.0, green: 35.0/255.0, blue: 105.0/255.0, alpha: 1)
        }
        //
       */
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
            
            
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
        
    }
    
}

extension MenuControllerVC: UITableViewDelegate {
    
}
