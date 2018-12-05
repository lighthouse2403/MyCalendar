//
//  MThemes.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 11/29/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class MThemes: NSObject {
    
    static var current = MThemes()
    
    // MARK: - Fonts
    func fontRegular(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
    func fontBold(_ size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }
    
    
    // MARK: - Navigation
    func navigationTitleFont() -> UIFont {
        return self.fontBold(16.0)
    }
    
    func navigationTitleColor() -> UIColor {
        return .white
    }
    
    func navigationBackgroundColor() -> UIColor {
        return UIColor(hex: themeBackgroundColor)
    }
    
    func navigationBackgroundImage() -> UIImage? {
        return UIImage(named: "navi_background")
    }
    
    func navigationBackImage() -> UIImage? {
        return UIImage(named: "arrow_gray_left")
    }
    
    
    // MARK: - TabBar
    func tabBarBackgroundColor() -> UIColor {
        return UIColor(hex: themeBackgroundColor)
    }
    
    func tabBarBackgroundImage() -> UIImage {
        return IMAGE("viet_tabbar")
    }
    
    
    func tabBarTextColor() -> UIColor {
        return UIColor.white
    }
    
    
    // MARK: - Common
    
    func backgroundColor() -> UIColor {
        return UIColor(hex: 0xfff7f7)
    }
    
    func defaultTextColor() -> UIColor {
        return UIColor.white
    }
    
    func placeholderColor() -> UIColor {
        return UIColor(hex: 0x999999)
    }
}
