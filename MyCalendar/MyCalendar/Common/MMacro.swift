//
//  MMacro.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 11/30/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

func LANGTEXT(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
    
//    let langCode = SETTINGS.string(forKey: kSELECTED_LANGUAGE) ?? "ja"
//
//    guard let path = Bundle.main.path(forResource: langCode, ofType: "lproj"),
//        let bundle = Bundle(path: path) else {
//            return ""
//    }
//
//    return NSLocalizedString(key, tableName: nil, bundle: bundle, value: "", comment: "")
}

func IMAGE(_ imageName: String) -> UIImage {
    return UIImage(named: imageName) ?? UIImage()
}

func IMAGEVIEW(_ imageName: String) -> UIImageView {
    return UIImageView(image: UIImage(named: imageName))
}

func FONT_REGULAR(_ size: CGFloat) -> UIFont {
    return MThemes.current.fontRegular(size)
}

func FONT_BOLD(_ size: CGFloat) -> UIFont {
    return MThemes.current.fontBold(size)
}

public let SETTINGS = UserDefaults.standard

func ZLOG(_ string: String,_ items: Any?..., file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
    #if DEBUG
    print(String(format: "[%d:%d] %@ - %@", line, column, function, String(format: string, items)))
    #else
    // Don't print to console log when release
    #endif
}
