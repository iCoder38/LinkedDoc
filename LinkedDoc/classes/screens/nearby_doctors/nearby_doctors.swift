//
//  nearby_doctors.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 19/03/24.
//

import UIKit
import SDWebImage
import CoreLocation

class nearby_doctors: UIViewController, CLLocationManagerDelegate {

    var arrListOfAppointment:Array<Any>!
    
    var arr_doctors_list:NSMutableArray! = []
    
    let locationManager = CLLocationManager()
    var strSaveLatitude:String!
    var strSaveLongitude:String!
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
    
    var arr_types_of_doctors:NSMutableArray! = []
    var arr_types_of_doctors_converted:NSMutableArray! = []
    
    @IBOutlet weak var btn_filter:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        self.convert_language()
        
    }
    
    @objc func convert_language() {
        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
        
        self.lbl_navigation_title.text = text_language.nearby_doctors_screen(status: "#01")
        
        
        
        self.btn_filter.addTarget(self, action: #selector(doctor_category), for: .touchUpInside)
        
        arr_types_of_doctors = [
            "Pediatrician",
            "Cardiologist",
            "Endocrinologist",
            
            "Gynecologist",
            "Neurologist",
            "Psychiatrist",
            
            "Dermatologist",
            "Oncologist",
            "Physicians",
            
            "Otolaryngologist",
            "Radiologist",
            "Emergency Medicine",
            
            "Gastroenterologist",
            "Ophthalmologist",
            "Orthopedist",
            
            "Pulmonologist",
            "Allergist",
            "Internists",
            
            "Nephrologist",
            "Dentist",
            "Geriatrician",
            
            "Epidemiologist",
            "Podiatrist",
            "Surgeon",
            ]
        
        arr_types_of_doctors_converted = [
            text_language.doctors_screen(status: "Pediatrician"),
            text_language.doctors_screen(status: "Cardiologist"),
            text_language.doctors_screen(status: "Endocrinologist"),
            
            text_language.doctors_screen(status: "Gynecologist"),
            text_language.doctors_screen(status: "Neurologist"),
            text_language.doctors_screen(status: "Psychiatrist"),
            
            text_language.doctors_screen(status: "Dermatologist"),
            text_language.doctors_screen(status: "Oncologist"),
            text_language.doctors_screen(status: "Physicians"),
            
            text_language.doctors_screen(status: "Otolaryngologist"),
            text_language.doctors_screen(status: "Radiologist"),
            text_language.doctors_screen(status: "Emergency Medicine"),
            
            text_language.doctors_screen(status: "Gastroenterologist"),
            text_language.doctors_screen(status: "Ophthalmologist"),
            text_language.doctors_screen(status: "Orthopedist"),
            
            text_language.doctors_screen(status: "Pulmonologist"),
            text_language.doctors_screen(status: "Allergist"),
            text_language.doctors_screen(status: "Internists"),
            
            text_language.doctors_screen(status: "Nephrologist"),
            text_language.doctors_screen(status: "Dentist"),
            text_language.doctors_screen(status: "Geriatrician"),
            
            text_language.doctors_screen(status: "Epidemiologist"),
            text_language.doctors_screen(status: "Podiatrist"),
            text_language.doctors_screen(status: "Surgeon"),
            ]
        // print(arr_types_of_doctors as Any)
        // print(arr_types_of_doctors.count as Any)
        
        self.check_location_is_enable_or_not()
    }
    
    @objc func check_location_is_enable_or_not() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                print("No access")
                self.strSaveLatitude = "0"
                self.strSaveLongitude = "0"
                
                ERProgressHud.sharedInstance.hide()
                
                let alert = NewYorkAlertController(title: text_language.common_screen(status: "alert"), message: text_language.common_screen(status: "enable_location"), style: .alert)
                let cancel = NewYorkButton(title: text_language.common_screen(status: "dismiss"), style: .cancel) {
                    _ in
                    self.navigationController?.popViewController(animated: true)
                }
                 alert.addButtons([cancel])
                 self.present(alert, animated: true)
                
            case .authorizedAlways, .authorizedWhenInUse:
                print("Access")
                
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
                
                
            @unknown default:
                break
            }
        }
    }
    
    // MARK:- GET CUSTOMER LOCATION -
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        self.strSaveLatitude = "\(locValue.latitude)"
        self.strSaveLongitude = "\(locValue.longitude)"
        // let indexPath = IndexPath.init(row: 0, section: 0)
        // let cell = self.tbleView.cellForRow(at: indexPath) as! PDCompleteAddressDetailsTableCell
       
        
        self.locationManager.stopUpdatingLocation()
        self.search_nearby_doctors(doctor_category: "doctors")
        // self.get_data_from_place_id()
    }
    
    @objc func doctor_category() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        for indexx in 0..<arr_types_of_doctors.count {
            
            if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
                print(language_select as Any)
                if (language_select == "en") {
                    alert.addAction(UIAlertAction(title: (arr_types_of_doctors[indexx] as! String), style: .default , handler:{ [self] (UIAlertAction)in
                        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
                        self.search_nearby_doctors(doctor_category: (arr_types_of_doctors[indexx] as! String))
                    }))
                } else {
                    alert.addAction(UIAlertAction(title: (arr_types_of_doctors_converted[indexx] as! String), style: .default , handler:{ [self] (UIAlertAction)in
                        ERProgressHud.sharedInstance.showDarkBackgroundView(withTitle: text_language.common_screen(status: "please_wait"))
                        self.search_nearby_doctors(doctor_category: (arr_types_of_doctors[indexx] as! String))
                    }))
                }
                
            }
            
            
        }
        
        self.present(alert, animated: true, completion: {
            //print("completion block")
        })
    }
    
    @objc func search_nearby_doctors(doctor_category:String) {
         
        
        let urlString:String = ("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(self.strSaveLatitude!),\(self.strSaveLongitude!)&radius=5000&keyword=\(doctor_category)&key=\(KGoogleApiKey)").addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!

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
                                    
                                    var ar : NSArray!
                                    ar = (json["results"] as! Array<Any>) as NSArray
                                    
                                    self.arrListOfAppointment = (ar as! Array<Any>)
                                    
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
    
    
}


//MARK:- TABLE VIEW -
extension nearby_doctors: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrListOfAppointment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:doctors_list_table_cell = tableView.dequeueReusableCell(withIdentifier: "doctors_list_table_cell") as! doctors_list_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        let item = self.arrListOfAppointment[indexPath.row] as? [String:Any]
        print(item as Any)
        
        cell.lbl_title.text = (item!["name"] as! String)
        cell.lbl_address.text = (item!["vicinity"] as! String)
        
        /*var dict: Dictionary<AnyHashable, Any>
        dict = item!["opening_hours"] as! Dictionary<AnyHashable, Any>
        
        if "\(dict["open_now"]!)" == "1" {
            cell.img_open_status.backgroundColor = .systemGreen
        } else {
            cell.img_open_status.backgroundColor = .systemRed
        }*/
        cell.img_open_status.isHidden = true
        
        
        
        // get photo
        if (item!["photos"] != nil) {
            var ar : NSArray!
            ar = (item!["photos"] as! Array<Any>) as NSArray
            
            let item_image = ar[0] as? [String:Any]
            
            cell.img_profile.sd_imageIndicator = SDWebImageActivityIndicator.grayLarge
            cell.img_profile.sd_setImage(with: URL(string: "https://maps.googleapis.com/maps/api/place/photo?maxwidth=4000&photoreference=\(item_image!["photo_reference"] as! String)&key=\(KGoogleApiKey)"), placeholderImage: UIImage(named: "logo"))
        }
        
        
    //https://maps.googleapis.com/maps/api/place/photo?maxwidth=4000&photoreference=\(item!["photo_reference"] as! String)&key=\(KGoogleApiKey)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = self.arrListOfAppointment[indexPath.row] as? [String:Any]
        let push = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "doctor_details_id") as? doctor_details
        push!.dict_get_doctor_details = (item! as NSDictionary)
        self.navigationController?.pushViewController(push!, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
