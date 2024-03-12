//
//  Utils.swift
//  LinkedDoc
//
//  Created by Dishant Rajput on 11/03/24.
//

import UIKit


var default_key_language = "key_select_language"
var english_language = "en"
var chinese_language = "ch"

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
