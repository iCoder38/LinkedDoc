//
//  translate_language.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 12/03/24.
//

import UIKit
import Foundation
import Speech

class translate_language: UIViewController, SFSpeechRecognizerDelegate {
    
    var str_back_menu:String!
    
    var postData:NSMutableData!
    
    var select_language_up:String! = "en"
    var select_language_down:String! = "es"
    
    //record
    @IBOutlet weak var recordButton: UIButton! {
        didSet {
            recordButton.setImage(UIImage(systemName: "mic"), for: .normal)
        }
    }
    
    var strStoreUserSelectLanguage:String! = "en-US"
    
    private var speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))!
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
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
            self.btn_back.addTarget(self, action: #selector(back_click_method1), for: .touchUpInside)
        } else {
            self.btn_back.setImage(UIImage(systemName: "list.dash"), for: .normal)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            self.sideBarMenu(button: self.btn_back)
        }
        
        
        
        
        self.initMic()
        
    }
    
    @objc func back_click_method1() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func initMic() {
        speechRecognizer.delegate = self
        recordButton.isEnabled = false
        requestSpeechAuthorization()
    }
    
    // Request Speech Authorization
    func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    self.recordButton.isEnabled = true
                case .denied, .restricted, .notDetermined:
                    self.recordButton.isEnabled = false
                @unknown default:
                    fatalError()
                }
            }
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
        let from = String(self.select_language_up)
        let to = String(self.select_language_down)
        
        print(from as Any)
        print(to as Any)
           
        postData = NSMutableData(data: "from=\(from)".data(using: String.Encoding.utf8)!)
        postData.append("&to=\(to)".data(using: String.Encoding.utf8)!)
        postData.append("\(merge_text)".data(using: String.Encoding.utf8)!)
        
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
                            print(json)
                            
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
    
    
    
    @objc func select_language_up_click() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! translate_language_table_cell
        
        let dummyList = ["English","Chinese","Spanish"]
        
        RPicker.selectOption(title: "Please select", cancelText: text_language.common_screen(status: "dismiss"), dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
            
            if (selctedText == "English") {
                self.select_language_up = "en"
                cell.btn_up.setTitle("English", for: .normal)
                self.strStoreUserSelectLanguage = "en-US"
                self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))! // English
                
            } else if (selctedText == "Chinese") {
                self.select_language_up = "zh-CN"
                cell.btn_up.setTitle("Chinese", for: .normal)
                self.strStoreUserSelectLanguage = "zh-CN"
                self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "zh-CN"))!
            } else {
                self.select_language_up = "es"
                cell.btn_up.setTitle("Spanish", for: .normal)
                self.strStoreUserSelectLanguage = "es-ES"
                self.speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "es-ES"))! // Spanish
            }
        }
    }
    
    @objc func select_language_down_click() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! translate_language_table_cell
        
        let dummyList = ["English","Chinese","Spanish"]
        
        RPicker.selectOption(title: "Please select", cancelText: text_language.common_screen(status: "dismiss"), dataArray: dummyList, selectedIndex: 0) { (selctedText, atIndex) in
            
            if (selctedText == "English") {
                self.select_language_down = "en"
                cell.btn_down.setTitle("English", for: .normal)
            } else if (selctedText == "Chinese") {
                self.select_language_down = "zh-CN"
                cell.btn_down.setTitle("Chinese", for: .normal)
            } else {
                self.select_language_down = "es"
                cell.btn_down.setTitle("Spanish", for: .normal)
            }
        }
    }
    
    
    // mic
    // Start recording and speech recognition
    @IBAction func recordButtonTapped(_ sender: UIButton) {
        if audioEngine.isRunning {
            debugPrint("start")
            audioEngine.stop()
            recognitionRequest?.endAudio()
            recordButton.setTitle("", for: .normal)
            recordButton.setImage(UIImage(systemName: "mic"), for: .normal)
        } else {
            debugPrint("stop")
            recordButton.setImage(UIImage(systemName: "mic.and.signal.meter.fill"), for: .normal)
            startRecording()
            recordButton.setTitle("", for: .normal)
        }
    }
    
    func startRecording() {
        let indexPath = IndexPath.init(row: 0, section: 0)
        let cell = self.tble_view.cellForRow(at: indexPath) as! translate_language_table_cell
        
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
        try! audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        
        let inputNode = audioEngine.inputNode
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create a recognition request.")
        }
        
        print(self.speechRecognizer);
        
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
            var isFinal = false
            
            if let result = result {
                cell.txt_view_up.text = result.bestTranscription.formattedString
                isFinal = result.isFinal
            }
            
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                self.recordButton.isEnabled = true
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        try! audioEngine.start()
        
        cell.txt_view_up.text = "Say something, I'm listening!"
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
        
        // if let person = UserDefaults.standard.value(forKey: str_save_login_user_data) as? [String:Any] {
            // print(person as Any)
            
            // if person["role"] as! String == "Doctor" {
                cell.lbl_text_up.text = "Lengua materna" //text_language.translate_language_screen(status: "#03")
                cell.lbl_text_down.text = "lenguaje selectivo" // text_language.translate_language_screen(status: "#04")
            // } else {
                // cell.lbl_text_up.text = "Lengua materna" // text_language.translate_language_screen(status: "#05")
                // cell.lbl_text_down.text = "Selective Language" // text_language.translate_language_screen(status: "#06")
            // }
        // }
        // text_language.translate_language_screen(status: "#04")
        if let language_select = UserDefaults.standard.string(forKey: default_key_language) {
            print(language_select as Any)
            if (language_select == "en") {
                cell.lbl_text_up.text = "Native language" //text_language.translate_language_screen(status: "#03")
                cell.lbl_text_down.text = "Selective language" // text_language.translate_language_screen(status: "#04")
            } else if (language_select == "ch") {
                cell.lbl_text_up.text = "母語:西班牙語" //text_language.translate_language_screen(status: "#03")
                cell.lbl_text_down.text = "母語:西班牙語" // text_language.translate_language_screen(status: "#04")
            } else {
                cell.lbl_text_up.text = "Lengua materna" //text_language.translate_language_screen(status: "#03")
                cell.lbl_text_down.text = "lenguaje selectivo" // text_language.translate_language_screen(status: "#04")
            }
            
        }
        
        cell.btn_up.addTarget(self, action: #selector(select_language_up_click), for: .touchUpInside)
        cell.btn_down.addTarget(self, action: #selector(select_language_down_click), for: .touchUpInside)
        
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
