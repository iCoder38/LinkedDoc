//
//  translate_language.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 12/03/24.
//

import UIKit
import Foundation

class translate_language: UIViewController {

    var str_back_menu:String!
    
    var postData:NSMutableData!
    
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
            tble_view.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
        
        self.tble_view.separatorColor = .clear
        
        if (self.str_back_menu == "back") {
            self.btn_back.setImage(UIImage(systemName: "arrow.left"), for: .normal)
            self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        } else {
            self.btn_back.setImage(UIImage(systemName: "list.dash"), for: .normal)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.sideBarMenu(button: self.btn_back)
        }
        
        
        
        
        
        
    }
    
    @objc func sideBarMenuClick2() {
        print("HIT")
        if revealViewController() != nil {
            
            btn_back.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            revealViewController().rearViewRevealWidth = 300
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    
    @objc func convert_language_click_method() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! translate_language_table_cell
        
        if (cell.txt_view_up.text == "") {
            return
        }
        
        self.convert_language(text_to_convert: cell.txt_view_up.text)
    }
    
    @objc func convert_language(text_to_convert:String) {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! translate_language_table_cell
        
        self.view.endEditing(true)
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "translating"))
        
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "X-RapidAPI-Key": String(str_rapid_api_key),
            "X-RapidAPI-Host": "google-translate113.p.rapidapi.com"
        ]

        
        
        
        let merge_text = "&text="+String(text_to_convert)
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person)
            
            if (person["role"] as! String) == "Member" {
                postData = NSMutableData(data: "from=zh-TW".data(using: String.Encoding.utf8)!)
                postData.append("&to=en".data(using: String.Encoding.utf8)!)
                postData.append("\(merge_text)".data(using: String.Encoding.utf8)!)
            } else {
                postData = NSMutableData(data: "from=en".data(using: String.Encoding.utf8)!)
                postData.append("&to=zh-TW".data(using: String.Encoding.utf8)!)
                postData.append("\(merge_text)".data(using: String.Encoding.utf8)!)
            }
            
        }
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://google-translate113.p.rapidapi.com/api/v1/translator/text")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                // print(httpResponse)
                DispatchQueue.main.async{
                    do {
                        //create json object from data
                        if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                            // print(json)
                           
                            cell.txt_view_down.text = (json["trans"] as! String)
                            ERProgressHud.sharedInstance.hide()
                            
                        }
                    } catch let error {
                        print(error.localizedDescription)
                        ERProgressHud.sharedInstance.hide()
                    }
                }
            }
        })

        dataTask.resume()
        
    }
}

//MARK:- TABLE VIEW -
extension translate_language: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:translate_language_table_cell = tableView.dequeueReusableCell(withIdentifier: "translate_language_table_cell") as! translate_language_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        self.lbl_navigation_title.text = text_language.translate_language_screen(status: "#01")
        cell.btn_translate.setTitle(text_language.translate_language_screen(status: "#02"), for: .normal)
        
        if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            print(person as Any)
            
            if person["role"] as! String == "Doctor" {
                cell.lbl_text_up.text = text_language.translate_language_screen(status: "#03")
                cell.lbl_text_down.text = text_language.translate_language_screen(status: "#04")
            } else {
                cell.lbl_text_up.text = text_language.translate_language_screen(status: "#05")
                cell.lbl_text_down.text = text_language.translate_language_screen(status: "#06")
            }
        }
        
        
        cell.btn_translate.addTarget(self, action: #selector(convert_language_click_method), for: .touchUpInside)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 900
    }

}
