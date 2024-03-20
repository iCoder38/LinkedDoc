//
//  details.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 18/03/24.
//

import UIKit
import Alamofire

class details: UIViewController {
    
    var dict_get_all_journal_data:NSDictionary!
    
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
            
            tble_view.separatorColor = .black
        }
    }
    var arr_cell_title:NSMutableArray! = []
    var arr_cell_sub_title:NSMutableArray! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btn_back.addTarget(self, action: #selector(back_click_method), for: .touchUpInside)
        
        self.convert_language()
    }
    
    @objc func convert_language() {
        self.lbl_navigation_title.text = text_language.all_journal_screen(status: "#01")
        
        let cell_title = [text_language.add_health_journal_screen(status: "#02"),
                          text_language.add_health_journal_screen(status: "#03"),
                          text_language.add_health_journal_screen(status: "#04"),
                          text_language.add_health_journal_screen(status: "#05"),
                          text_language.on_set_screen(status: "#03"),
                          text_language.provocation_screen(status: "#02"),
                          text_language.common_screen(status: "dull_option_dull"),
                          text_language.common_screen(status: "constant_option_constant"),
                          text_language.region_screen(status: "#02"),
                          text_language.region_screen(status: "#03"),
                          text_language.severity_screen(status: "#02"),
                          text_language.timings_screen(status: "#02"),
                          text_language.actions_screen(status: "#02")
        ]
        
        let cell_sub_title = [(self.dict_get_all_journal_data["BP"] as! String),
                              (self.dict_get_all_journal_data["weight"] as! String),
                              (self.dict_get_all_journal_data["exercise_time"] as! String),
                              (self.dict_get_all_journal_data["notable_event"] as! String),
                              
                              (self.dict_get_all_journal_data["event_description"] as! String), // onset
                              
                              (self.dict_get_all_journal_data["event_extra"] as! String), // provocation
                              
                              (self.dict_get_all_journal_data["describe_plan_1"] as! String), // describe_plan_1
                              (self.dict_get_all_journal_data["describe_plan_2"] as! String), // describe_plan_2
                              
                              (self.dict_get_all_journal_data["location"] as! String), // where
                              (self.dict_get_all_journal_data["stimulus"] as! String), // is there
                              
                              (self.dict_get_all_journal_data["scale"] as! String), // severity
                              
                              (self.dict_get_all_journal_data["about_event"] as! String), // timings
                              
                              (self.dict_get_all_journal_data["event_action"] as! String) // event_action
        ]
        
        self.arr_cell_title.addObjects(from: cell_title)
        self.arr_cell_sub_title.addObjects(from: cell_sub_title)
        
        print(self.arr_cell_title.count as Any)
        print(self.arr_cell_sub_title.count as Any)
        
        self.tble_view.delegate = self
        self.tble_view.dataSource = self
        self.tble_view.reloadData()
    }
    
     
}


//MARK:- TABLE VIEW -
extension details: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_cell_title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:details_table_cell = tableView.dequeueReusableCell(withIdentifier: "details_table_cell") as! details_table_cell
        
        cell.backgroundColor = .clear
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = backgroundView
        
        print(self.dict_get_all_journal_data as Any)
        
        cell.lbl_title.text = (self.arr_cell_title[indexPath.row] as! String)
        cell.lbl_sub_title.text = (self.arr_cell_sub_title[indexPath.row] as! String)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if (indexPath.row == 0) {
            if (self.dict_get_all_journal_data["BP"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 1) {
            if (self.dict_get_all_journal_data["weight"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 2) {
            if (self.dict_get_all_journal_data["exercise_time"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 3) {
            if (self.dict_get_all_journal_data["notable_event"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 4) {
            if (self.dict_get_all_journal_data["event_description"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 5) {
            if (self.dict_get_all_journal_data["event_extra"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 6) {
            if (self.dict_get_all_journal_data["describe_plan_1"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 7) {
            if (self.dict_get_all_journal_data["describe_plan_2"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 8) {
            if (self.dict_get_all_journal_data["location"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 9) {
            if (self.dict_get_all_journal_data["stimulus"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 10) {
            if (self.dict_get_all_journal_data["scale"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 11) {
            if (self.dict_get_all_journal_data["about_event"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else  if (indexPath.row == 12) {
            if (self.dict_get_all_journal_data["event_action"] as! String) == "" {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        } else {
            return UITableView.automaticDimension
        }
        
    }

}

