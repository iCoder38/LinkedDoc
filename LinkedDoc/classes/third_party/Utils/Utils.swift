//
//  Utils.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit

var application_base_url = "https://demo4.evirtualservices.net/linkdoc/services/index"

// keys
var str_rapid_api_keys = "0947338691msh3f39d264894c812p10b756jsnff8e4a6543e7"

let str_save_login_user_data = "keyLoginFullData"
let str_save_last_api_token = "key_last_api_token"

let your_are_not_auth = "You are not authorize to access the API"

var default_key_language = "key_select_language"
var english_language = "en"
var chinese_language = "ch"

var KGoogleApiKey = "AIzaSyAULQHYzpkutmeYPo9nU3BIGTlFlw9ZuH8"

class Utils: NSObject {

    class func light_vibrate() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
    
    class func medium_vibrate() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    class func heavy_vibrate() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred()
    }
    
}
