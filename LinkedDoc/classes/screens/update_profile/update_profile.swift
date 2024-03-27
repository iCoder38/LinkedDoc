//
//  update_profile.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 13/03/24.
//

import UIKit
import Alamofire
import SDWebImage

class update_profile: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // image
    var imgUploadYesOrNo:String! = "0"
    var imageStr:String!
    var imgData:Data!
    
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
            btn_back.setImage(UIImage(systemName: "list.dash"), for: .normal)
        }
    }
    
    @IBOutlet weak var tble_view:UITableView! {
        didSet {
            tble_view.backgroundColor = app_bg_color
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.sideBarMenu(button: self.btn_back)
    }
    
    @objc func parse_data_from_server() {
        
    }
    @objc func continue_click_method2() {
        Utils.light_vibrate()
        
        self.create_an_account()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @objc func create_an_account() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! updating_profile_table_cell
        
        if (cell.txt_name.text == "") {
            return
        }
        if (cell.txt_email.text == "") {
            return
        }
        if (cell.txt_phone.text == "") {
            return
        }
        self.view.endEditing(true)
        var parameters:Dictionary<AnyHashable, Any>!
        
        if (self.imgUploadYesOrNo == "1") {
            self.upload_date_with_image()
        } else{
            ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "updating"))
            
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
                        "fullName"      : String(cell.txt_name.text!),
                        "email"         : String(cell.txt_email.text!),
                        "contactNumber" : String(cell.txt_phone.text!),
                        "role"          : (person["role"] as! String),
                        "device"        : String("iOS")
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
                                    
                                    /*let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "complete_profile_id")
                                     self.navigationController?.pushViewController(push, animated: true)*/
                                    
                                    if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                        print(language_select as Any)
                                        
                                        if (language_select == "en") {
                                            
                                            /*let alert = NewYorkAlertController(title: JSON["status"] as? String, message: JSON["msg"] as? String, style: .alert)
                                             let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel)
                                             alert.addButtons([cancel])
                                             self.present(alert, animated: true)*/
                                            
                                            self.view.makeToast(JSON["msg"] as? String)
                                        } else {
                                            
                                            /*let alert = NewYorkAlertController(title: text_language.common_screen(status: "success"), message: JSON["msg_ch"] as? String, style: .alert)
                                             let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel)
                                             alert.addButtons([cancel])
                                             self.present(alert, animated: true)*/
                                            
                                            self.view.makeToast(JSON["msg_ch"] as? String)
                                            
                                        }
                                        
                                    }
                                    
                                    
                                }
                                else {
                                    self.generate_token(status: "0")
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
                    self.generate_token(status: "0")
                }
            }
        }
        
        
    }
    
    @objc func generate_token(status:String) {
        
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
                        
                        if (status == "0") {
                            self.create_an_account()
                        } else {
                            self.upload_date_with_image()
                        }
                        
                        
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
    
    
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        self.uploadImageOpenActionSheet()
    }
    
    @objc func uploadImageOpenActionSheet() {
        let alert = UIAlertController(title: text_language.common_screen(status: "upload_profile_picture"), message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: text_language.common_screen(status: "camera"), style: .default , handler:{ (UIAlertAction)in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: text_language.common_screen(status: "gallery"), style: .default , handler:{ (UIAlertAction)in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction(title: text_language.common_screen(status: "dismiss"), style: .destructive, handler:{ (UIAlertAction)in
            //print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            //print("completion block")
        })
    }
    @objc func openCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera;
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func openGallery() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary;
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! updating_profile_table_cell
        
        imgUploadYesOrNo = "1"
        
        
        let image_data = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        cell.img_profile.image = image_data // show image on image view
        let imageData:Data = image_data!.pngData()!
        imageStr = imageData.base64EncodedString()
        self.dismiss(animated: true, completion: nil)
        
        imgData = image_data!.jpegData(compressionQuality: 0.2)!
        //print(type(of: imgData))
        //print(imgData)
        
    }
    
    @objc func upload_date_with_image() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! updating_profile_table_cell
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            
            ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "updating"))
            let x : Int = (person["userId"] as! Int)
            let myString = String(x)
            
            if let token_id_is = UserDefaults.standard.string(forKey: str_save_last_api_token) {
                
                let _: HTTPHeaders = [
                    "token":String(token_id_is),
                ]
                
                var urlRequest = URLRequest(url: URL(string: application_base_url)!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0 * 1000)
                urlRequest.httpMethod = "POST"
                urlRequest.allHTTPHeaderFields = ["token":String(token_id_is)]
                urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
                
                // let indexPath = IndexPath.init(row: 0, section: 0)
                // let cell = self.tablView.cellForRow(at: indexPath) as! AddTableTableViewCell
                
                //Set Your Parameter
                let parameterDict = NSMutableDictionary()
                parameterDict.setValue("editprofile", forKey: "action")
                parameterDict.setValue(String(myString), forKey: "userId")
                
                parameterDict.setValue(String(cell.txt_name.text!), forKey: "fullName")
                parameterDict.setValue(String(cell.txt_email.text!), forKey: "email")
                parameterDict.setValue(String(cell.txt_phone.text!), forKey: "contactNumber")
                parameterDict.setValue((person["role"] as! String), forKey: "role")
                parameterDict.setValue(String("iOS"), forKey: "device")
                
                // Now Execute
                AF.upload(multipartFormData: { multiPart in
                    for (key, value) in parameterDict {
                        if let temp = value as? String {
                            multiPart.append(temp.data(using: .utf8)!, withName: key as! String)
                        }
                        if let temp = value as? Int {
                            multiPart.append("\(temp)".data(using: .utf8)!, withName: key as! String)
                        }
                        if let temp = value as? NSArray {
                            temp.forEach({ element in
                                let keyObj = key as! String + "[]"
                                if let string = element as? String {
                                    multiPart.append(string.data(using: .utf8)!, withName: keyObj)
                                } else
                                if let num = element as? Int {
                                    let value = "\(num)"
                                    multiPart.append(value.data(using: .utf8)!, withName: keyObj)
                                }
                            })
                        }
                    }
                    multiPart.append(self.imgData, withName: "image", fileName: "profile_picture.png", mimeType: "image/png")
                }, with: urlRequest)
                .uploadProgress(queue: .main, closure: { progress in
                    //Current upload progress of file
                    print("Upload Progress: \(progress.fractionCompleted)")
                })
                .responseJSON(completionHandler: { data in
                    
                    switch data.result {
                        
                    case .success(_):
                        do {
                            
                            let dictionary = try JSONSerialization.jsonObject(with: data.data!, options: .fragmentsAllowed) as! NSDictionary
                            
                            print("Success!")
                            print(dictionary)
                            
                            var strSuccess : String!
                            strSuccess = dictionary["msg"] as? String
                            
                            if (strSuccess == your_are_not_auth) {
                                self.generate_token(status: "1")
                            } else {
                                ERProgressHud.sharedInstance.hide()
                                
                                let JSON = dictionary
                                print(JSON)
                                
                                if "\(JSON["status"]!)" != "Fails" {
                                    
                                    var dict: Dictionary<AnyHashable, Any>
                                    dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                                    
                                    let defaults = UserDefaults.standard
                                    defaults.setValue(dict, forKey: str_save_login_user_data)
                                    
                                    self.imgUploadYesOrNo = "0"
                                    
                                    if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                        print(language_select as Any)
                                        
                                        if (language_select == "en") {
                                            
                                            self.view.makeToast(dictionary["msg"] as? String)
                                        } else {
                                            
                                            self.view.makeToast(dictionary["msg_ch"] as? String)
                                            
                                        }
                                        
                                    }
                                    if (dict["role"] as! String) == "Member" {
                                        
                                        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "patient_complete_profile_id")
                                        self.navigationController?.pushViewController(push, animated: true)
                                    } else {
                                        
                                        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "complete_profile_id")
                                        self.navigationController?.pushViewController(push, animated: true)
                                        
                                    }
                                } else {
                                    
                                    if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                        print(language_select as Any)
                                        if (language_select == "en") {
                                            
                                            self.view.makeToast(dictionary["msg"] as? String)
                                        } else {
                                            
                                            self.view.makeToast(dictionary["msg_ch"] as? String)
                                        }
                                        
                                    }
                                    
                                }
                                
                                /*var dict: Dictionary<AnyHashable, Any>
                                dict = JSON["data"] as! Dictionary<AnyHashable, Any>
                                
                                let defaults = UserDefaults.standard
                                defaults.setValue(dict, forKey: str_save_login_user_data)
                                
                                self.imgUploadYesOrNo = "0"
                                
                                if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                                    print(language_select as Any)
                                    
                                    if (language_select == "en") {
                                        
                                        self.view.makeToast(dictionary["msg"] as? String)
                                    } else {
                                        
                                        self.view.makeToast(dictionary["msg_ch"] as? String)
                                        
                                    }
                                    
                                }*/
                                
                            }
                            
                            
                        }
                        catch {
                            // catch error.
                            print("catch error")
                            ERProgressHud.sharedInstance.hide()
                        }
                        break
                        
                    case .failure(_):
                        print("failure")
                        ERProgressHud.sharedInstance.hide()
                        break
                        
                    }
                    
                    
                })
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! updating_profile_table_cell
        
        if (textField == cell.txt_phone) {
            
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            // make sure the result is under 16 characters
            return updatedText.count <= 10
            
            
            
        }  else {
            
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            // make sure the result is under 16 characters
            return updatedText.count <= 30
            
        }
        
    }
    
}

//MARK:- TABLE VIEW -
extension update_profile: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:updating_profile_table_cell = tableView.dequeueReusableCell(withIdentifier: "updating_profile_table_cell") as! updating_profile_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        cell.btn_continue.setTitle(text_language.create_an_account_screen(status: "#09"), for: .normal)
        
        // self.convert_language()
        self.lbl_navigation_title.text = text_language.create_an_account_screen(status: "#10")
        
        cell.txt_name.placeholder = text_language.create_an_account_screen(status: "#04")
        cell.txt_email.placeholder = text_language.create_an_account_screen(status: "#05")
        cell.txt_phone.placeholder = text_language.create_an_account_screen(status: "#06")
                
        cell.txt_name.delegate = self
        cell.txt_email.delegate = self
        cell.txt_phone.delegate = self
        
        cell.btn_continue.addTarget(self, action: #selector(continue_click_method2), for: .touchUpInside)
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            cell.img_profile.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
            cell.img_profile.sd_setImage(with: URL(string: (person["image"] as! String)), placeholderImage: UIImage(named: "avatar"))
            
            cell.txt_name.text = (person["fullName"] as! String)
            cell.txt_email.text = (person["email"] as! String)
            cell.txt_phone.text = (person["contactNumber"] as! String)
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        cell.img_profile.isUserInteractionEnabled = true
        cell.img_profile.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
         
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 820
    }

}
