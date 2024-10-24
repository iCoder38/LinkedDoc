//
//  doctor_details.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 19/03/24.
//

import UIKit
import Alamofire
import SDWebImage

class doctor_details: UIViewController {
    
    var dict_get_doctor_details:NSDictionary!
    
    var str_lat:String!
    var str_long:String!
    
    var dict_all_details_from_place_id:NSDictionary!
    
    var collectionView: UICollectionView?
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var arr_all_photos:NSMutableArray! = []
    
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
            tble_view.backgroundColor = .clear
            
            tble_view.separatorColor = .clear
        }
    }
    
    var arr_title:NSMutableArray! = []
    var arr_sub_title:NSMutableArray! = []
    
    @IBOutlet weak var img_profile:UIImageView! {
        didSet {
            img_profile.layer.cornerRadius = 40
            img_profile.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var lbl_open_status:UILabel!
    @IBOutlet weak var lbl_wheelchair_access:UILabel!
    
    var str_days_timings:String! = "N.A."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        // print(self.dict_get_doctor_details as Any)
        
        self.convert_language()
    }
    
    @objc func convert_language() {
        self.lbl_navigation_title.text = text_language.welcome_screen(status: "#03")
        
        self.arr_title = ["Name",
        "Status",
        "Rating",
        "Address",
        "Direction"]
        
        var status:String!
        if (self.dict_get_doctor_details["opening_hours"] == nil) {
            status = "N.A."
            self.lbl_open_status.textColor = .systemGray
            self.lbl_open_status.text = String(status)
        } else {
            var dict: Dictionary<AnyHashable, Any>
            dict = self.dict_get_doctor_details["opening_hours"] as! Dictionary<AnyHashable, Any>
             
            
            if "\(dict["open_now"]!)" == "1" {
                status = "Open"
                self.lbl_open_status.textColor = .systemGreen
            } else {
                status = "Close"
                self.lbl_open_status.textColor = .systemRed
            }
            
            self.lbl_open_status.text = String(status)
        }
        
        
        self.arr_sub_title = [(self.dict_get_doctor_details["name"] as! String),
                              (self.dict_get_doctor_details["business_status"] as! String),
                              "\(self.dict_get_doctor_details["rating"]!) (\(self.dict_get_doctor_details["user_ratings_total"]!))",
                              (self.dict_get_doctor_details["vicinity"] as! String),
                              ""]
        
        
        var geo: Dictionary<AnyHashable, Any>
        geo = self.dict_get_doctor_details["geometry"] as! Dictionary<AnyHashable, Any>
        
        var loc: Dictionary<AnyHashable, Any>
        loc = geo["location"] as! Dictionary<AnyHashable, Any>
        
        self.str_lat = "\(loc["lat"]!)"
        self.str_long = "\(loc["lng"]!)"
        
        self.get_data_from_place_id()
        
        
    }
    
    @objc func get_data_from_place_id() {
        
        let urlString:String = ("https://maps.googleapis.com/maps/api/place/details/json?place_id=\(self.dict_get_doctor_details["place_id"] as! String)&key=\(KGoogleApiKey)").addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!

                let url : URL = URL(string: urlString)!
                let request: URLRequest = URLRequest(url:url)
                let config = URLSessionConfiguration.default
                let session = URLSession(configuration: config)

                let task = session.dataTask(with: request) { (data, response, error) in

                    if(error != nil){
                        print(error?.localizedDescription ?? "")
                    }
                    else{
                        DispatchQueue.main.async{
                            do{
                                // let jsonDict:NSDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                                // print(jsonDict as Any)
                                if let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                                     print(json)
                                    ERProgressHud.sharedInstance.hide()
                                    
                                    var dict: Dictionary<AnyHashable, Any>
                                    dict = json["result"] as! Dictionary<AnyHashable, Any>
                                    print(dict)
                                    
                                    self.dict_all_details_from_place_id = dict as NSDictionary
                                    
                                    var status:String!
                                    if (self.dict_all_details_from_place_id["opening_hours"] == nil) {
                                        status = "N.A."
                                        self.lbl_open_status.textColor = .systemGray
                                        self.lbl_open_status.text = String(status)
                                    } else {
                                        var dict_opening_hour: Dictionary<AnyHashable, Any>
                                        dict_opening_hour = self.dict_all_details_from_place_id["opening_hours"] as! Dictionary<AnyHashable, Any>
                                        // print(dict_opening_hour as Any)
                                        // print(dict_opening_hour["weekday_text"] as Any)
                                        
                                        ////////////////////////////////////////////////////////////////////////////////////////
                                        // weekday text //
                                        ////////////////////////////////////////////////////////////////////////////////////////
                                        var ar : NSArray!
                                        if (dict_opening_hour["weekday_text"] == nil) {
                                            self.str_days_timings = String("N.A.")
                                        } else {
                                            ar = (dict_opening_hour["weekday_text"] as! Array<Any>) as NSArray
                                            // print(ar as Any)
                                            let strArray = self.getString(array: ar as! [String])
                                            // print(strArray)
                                            let modified = strArray.replacingOccurrences(of: ",", with: "\n")
                                            self.str_days_timings = String(modified)
                                        }
                                        
                                        
                                        ////////////////////////////////////////////////////////////////////////////////////////
                                        ////////////////////////////////////////////////////////////////////////////////////////
                                        ///// Open Now
                                        if "\(dict_opening_hour["open_now"]!)" == "1" {
                                            status = text_language.doctors_details_screen(status: "#09")
                                            self.lbl_open_status.textColor = .systemGreen
                                        } else {
                                            status = text_language.doctors_details_screen(status: "#10")
                                            self.lbl_open_status.textColor = .systemRed
                                        }
                                        
                                        self.lbl_open_status.text = String(status)
                                    }
                                    
                                    ////////////////////////////////////////////////////////////////////////////////////////
                                    ///// WHEELCHAIR ACCESSIBLE ENTRANCE
                                    if (dict["wheelchair_accessible_entrance"] == nil) {
                                        self.lbl_wheelchair_access.text = "N.A."
                                        self.lbl_wheelchair_access.textColor = .systemGray
                                    } else {
                                        if "\(dict["wheelchair_accessible_entrance"]!)" == "1" {
                                            self.lbl_wheelchair_access.text = "Yes"
                                            self.lbl_wheelchair_access.textColor = .systemGreen
                                        } else {
                                            self.lbl_wheelchair_access.text = "No"
                                            self.lbl_wheelchair_access.textColor = .systemRed
                                        }
                                    }
                                    ////////////////////////////////////////////////////////////////////////////////////////
                                    ////////////////////////////////////////////////////////////////////////////////////////
                                    
                                    
                                    
                                    var exception_rating:String! = "N.A."
                                    if (self.dict_all_details_from_place_id["rating"] != nil) {
                                        exception_rating = "\(self.dict_all_details_from_place_id["rating"]!)"
                                    }
                                    
                                    var exception_website:String! = "N.A."
                                    if (self.dict_all_details_from_place_id["website"] != nil) {
                                        exception_website = "\(self.dict_all_details_from_place_id["website"]!)"
                                    }
                                    
                                    var exception_phone_number:String! = "N.A."
                                    if (self.dict_all_details_from_place_id["international_phone_number"] != nil) {
                                        exception_phone_number = "\(self.dict_all_details_from_place_id["international_phone_number"]!)"
                                    }
                                    
                                    if (self.dict_get_doctor_details!["photos"] != nil) {
                                        var ar : NSArray!
                                        ar = (self.dict_all_details_from_place_id!["photos"] as! Array<Any>) as NSArray
                                        print(ar as Any)
                                        
                                        self.arr_all_photos.addObjects(from: ar as! [Any])
                                        
                                    }
                                    
                                    // print(self.arr_all_photos as Any)
                                    // print(self.arr_all_photos.count as Any)
                                    
                                    self.arr_title = [
                                        text_language.doctors_details_screen(status: "#01"),
                                        text_language.doctors_details_screen(status: "#02"),
                                        text_language.doctors_details_screen(status: "#03"),
                                        text_language.doctors_details_screen(status: "#04"),
                                        text_language.doctors_details_screen(status: "#05"),
                                        text_language.doctors_details_screen(status: "#06"),
                                        text_language.doctors_details_screen(status: "#07"),
                                    ]
                                    
                                    self.arr_sub_title = [(self.dict_all_details_from_place_id["name"] as! String),
                                                          String(exception_phone_number),
                                                          
                                                        (self.dict_all_details_from_place_id["formatted_address"] as! String),
                                                          String(exception_website),
                                                          String(exception_rating),
                                                          String(self.str_days_timings),
                                                          ""
                                                          
                                    ]
                                    
                                    
                                    self.tble_view.delegate = self
                                    self.tble_view.dataSource = self
                                    self.tble_view.reloadData()
                                    
                                }
                            }
                            catch{
                                print(error.localizedDescription)
                                ERProgressHud.sharedInstance.hide()
                            }
                        }
                    }
                };
                task.resume()
    }
    
    func getString(array : [String]) -> String {
            let stringArray = array.map{ String($0) }
            return stringArray.joined(separator: ",")
        }
}


//MARK:- TABLE VIEW -
extension doctor_details: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr_title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (self.arr_title[indexPath.row] as! String == "Photos") {
            let cell:doctor_details_table_cell = tableView.dequeueReusableCell(withIdentifier: "photos_table_cell") as! doctor_details_table_cell
            
            cell.backgroundColor = .clear
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
            // cell.lbl_title.text = (self.arr_title[indexPath.row] as! String)
            // cell.lbl_sub_title.text = (self.arr_sub_title[indexPath.row] as! String)
             
            cell.clView.delegate = self
            cell.clView.dataSource = self
            cell.clView.reloadData()
            
            /*if (self.dict_get_doctor_details!["photos"] != nil) {
                var ar : NSArray!
                ar = (self.dict_get_doctor_details!["photos"] as! Array<Any>) as NSArray
                print(ar as Any)
                
                let item_image = ar[0] as? [String:Any]
                self.img_profile.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
                self.img_profile.sd_setImage(with: URL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=4000&photoreference=\(item_image!["photo_reference"] as! String)&key=\(KGoogleApiKey)"), placeholderImage: UIImage(named: "logo"))
            }*/
            return cell
        } else {
            let cell:doctor_details_table_cell = tableView.dequeueReusableCell(withIdentifier: "doctor_details_table_cell") as! doctor_details_table_cell
            
            cell.backgroundColor = .clear
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = .clear
            cell.selectedBackgroundView = backgroundView
            
            cell.lbl_title.text = (self.arr_title[indexPath.row] as! String)
            cell.lbl_sub_title.text = (self.arr_sub_title[indexPath.row] as! String)
            
            if (self.dict_get_doctor_details!["photos"] != nil) {
                var ar : NSArray!
                ar = (self.dict_get_doctor_details!["photos"] as! Array<Any>) as NSArray
                
                let item_image = ar[0] as? [String:Any]
                self.img_profile.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
                self.img_profile.sd_setImage(with: URL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=4000&photoreference=\(item_image!["photo_reference"] as! String)&key=\(KGoogleApiKey)"), placeholderImage: UIImage(named: "logo"))
            }
            if (self.arr_title[indexPath.row] as! String == "Address") {
                cell.accessoryType = .disclosureIndicator
            }
            
            if (self.dict_all_details_from_place_id["international_phone_number"] != nil) {
                if (self.arr_title[indexPath.row] as! String == "Phone Number") {
                    cell.accessoryType = .disclosureIndicator
                }
            }
            
             
            if (self.dict_all_details_from_place_id["website"] != nil) {
                if (self.arr_title[indexPath.row] as! String == "Website") {
                    cell.accessoryType = .disclosureIndicator
                }
            }
            
            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (self.arr_title[indexPath.row] as! String == "Address") {
            print("hit")
            //Working in Swift new versions.
            
            if let url = URL(string: "comgooglemaps://?saddr=&daddr=\(String(self.str_lat)),\(String(self.str_long))&directionsmode=driving") {
                UIApplication.shared.open(url, options: [:])
            }
        }
        
        if (self.arr_title[indexPath.row] as! String == "Website") {
            print("website")
            //Working in Swift new versions.
            
            if (self.dict_all_details_from_place_id["website"] != nil) {
                
                if let url = URL(string: "\(self.dict_all_details_from_place_id["website"]!)") {
                    UIApplication.shared.open(url)
                }
                
            }
            
            
        }
        if (self.arr_title[indexPath.row] as! String == "Phone Number") {
            print("website")
            //Working in Swift new versions.
            
            if (self.dict_all_details_from_place_id["international_phone_number"] != nil) {
                
                if let url = URL(string: "tel://\(self.dict_all_details_from_place_id["international_phone_number"]!)"), UIApplication.shared.canOpenURL(url) {
                    if #available(iOS 10, *) {
                        UIApplication.shared.open(url)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
                
            }
            
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (self.arr_title[indexPath.row] as! String == "Photos") {
            if (self.arr_all_photos.count == 1 || self.arr_all_photos.count == 2) {
                return 120
            } else if (self.arr_all_photos.count == 3 || self.arr_all_photos.count == 4 || self.arr_all_photos.count == 5) {
                return 240
            } else if (self.arr_all_photos.count == 6 || self.arr_all_photos.count == 7 || self.arr_all_photos.count == 8) {
                return 360
            }  else if (self.arr_all_photos.count == 9 || self.arr_all_photos.count == 10) {
                return 480
            } else if (self.arr_all_photos.count == 0) {
                return 0
            } else {
                return 120
            }
            
        } else {
            return UITableView.automaticDimension
        }
        
    }

}

extension doctor_details: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "doctor_details_collection_cell", for: indexPath as IndexPath) as! doctor_details_collection_cell
        
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.borderWidth = 0.70
    
        cell.backgroundColor = .white
        
        let item = self.arr_all_photos[indexPath.row] as? [String:Any]
        // print(item as Any)
        // print(item!["photo_reference"] as Any)
        
        let link:String! = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=4000&photoreference=\(item!["photo_reference"] as! String)&key=\(KGoogleApiKey)"
        // print(link as Any)
        
         cell.img.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
         cell.img.sd_setImage(with: URL(string: String(link)), placeholderImage: UIImage(named: "avatar"))
        
        return cell
        
    }
    
    //UICollectionViewDatasource methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arr_all_photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       
            CGSize(width: 100, height: 100)
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}

class doctor_details_collection_cell: UICollectionViewCell {
    @IBOutlet weak var img:UIImageView!
}
