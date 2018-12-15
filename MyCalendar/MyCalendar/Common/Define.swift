//
//  Define.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 11/30/18.
//  Copyright © 2018 themask. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Color
let themeBackgroundColor    = 0x73D4FF
let todayColor              = 0x47AC66

// MARK: - Data
let arrCan = ["Giáp","Ất","Bính","Đinh","Mậu","Kỷ","Canh","Tân","Nhâm","Quý"]
let arrChi = ["Tý","Sửu","Dần","Mão","Thìn","Tỵ","Ngọ","Mùi","Thân","Dậu","Tuất","Hợi"]

// MARK: - Type
typealias PJSON = [String: Any]
typealias PKEYS = [NSAttributedStringKey: Any]

// MARK: - Size
let SCREEN_WIDTH                = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT               = UIScreen.main.bounds.size.height
let kBOTTOM_BAR_iPHONEX: CGFloat = 34.0
let kUUID                       = (UIDevice.current.identifierForVendor?.uuidString)!
