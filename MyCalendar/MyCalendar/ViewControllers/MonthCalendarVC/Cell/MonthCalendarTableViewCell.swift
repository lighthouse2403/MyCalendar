//
//  MonthCalendarTableViewCell.swift
//  MyCalendar
//
//  Created by Dang Nguyen on 12/10/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class MonthCalendarTableViewCell: UITableViewCell {

    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tueLabel: UILabel!
    @IBOutlet weak var wedLabel: UILabel!
    @IBOutlet weak var thurLabel: UILabel!
    @IBOutlet weak var friLabel: UILabel!
    @IBOutlet weak var satLabel: UILabel!
    @IBOutlet weak var sunLabel: UILabel!
    
    @IBOutlet weak var lunarMonLabel: UILabel!
    @IBOutlet weak var lunarTueLabel: UILabel!
    @IBOutlet weak var lunarWedLabel: UILabel!
    @IBOutlet weak var lunarThurLabel: UILabel!
    @IBOutlet weak var lunarFriLabel: UILabel!
    @IBOutlet weak var lunarSatLabel: UILabel!
    @IBOutlet weak var lunarSunLabel: UILabel!
    
    @IBOutlet weak var monView: UIView!
    @IBOutlet weak var tueView: UIView!
    @IBOutlet weak var wedView: UIView!
    @IBOutlet weak var thurView: UIView!
    @IBOutlet weak var friView: UIView!
    @IBOutlet weak var satView: UIView!
    @IBOutlet weak var sunView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func tappedDate(_ sender: UIButton) {
    }
    
    func setupDate(mon: Double, tue: Double, wed: Double, thur: Double, fri: Double, sat: Double, sun: Double, currentDate: Date) {
        
        // Border date view
        monView.setupBorder()
        tueView.setupBorder()
        wedView.setupBorder()
        thurView.setupBorder()
        friView.setupBorder()
        satView.setupBorder()
        sunView.setupBorder()

        let monDate     = Date.init(timeIntervalSince1970: mon)
        let tueDate     = Date.init(timeIntervalSince1970: tue)
        let wedDate     = Date.init(timeIntervalSince1970: wed)
        let thurDate    = Date.init(timeIntervalSince1970: thur)
        let friDate     = Date.init(timeIntervalSince1970: fri)
        let satDate     = Date.init(timeIntervalSince1970: sat)
        let sunDate     = Date.init(timeIntervalSince1970: sun)

        // Normal calendar
        mondayLabel.text    = "\(monDate.Day)"
        tueLabel.text       = "\(tueDate.Day)"
        wedLabel.text       = "\(wedDate.Day)"
        thurLabel.text      = "\(thurDate.Day)"
        friLabel.text       = "\(friDate.Day)"
        satLabel.text       = "\(satDate.Day)"
        sunLabel.text       = "\(sunDate.Day)"
        
        // Lunar
        let lunarMon = DateMacro.convertSolar2Lunar(monDate.Day,mm: monDate.Month, yy: monDate.Year, timeZone: 7.0).0 == 1 ? "\(DateMacro.convertSolar2Lunar(monDate.Day,mm: monDate.Month, yy: monDate.Year, timeZone: 7.0).0)/\(DateMacro.convertSolar2Lunar(monDate.Day,mm: monDate.Month, yy: monDate.Year, timeZone: 7.0).1)" : "\(DateMacro.convertSolar2Lunar(monDate.Day,mm: monDate.Month, yy: monDate.Year, timeZone: 7.0).0)"
        
        let lunarTue = DateMacro.convertSolar2Lunar(tueDate.Day,mm: tueDate.Month, yy: tueDate.Year, timeZone: 7.0).0 == 1 ? "\(DateMacro.convertSolar2Lunar(tueDate.Day,mm: tueDate.Month, yy: tueDate.Year, timeZone: 7.0).0)/\(DateMacro.convertSolar2Lunar(tueDate.Day,mm: tueDate.Month, yy: tueDate.Year, timeZone: 7.0).1)" : "\(DateMacro.convertSolar2Lunar(tueDate.Day,mm: tueDate.Month, yy: tueDate.Year, timeZone: 7.0).0)"

        let lunarWed = DateMacro.convertSolar2Lunar(wedDate.Day,mm: wedDate.Month, yy: wedDate.Year, timeZone: 7.0).0 == 1 ? "\(DateMacro.convertSolar2Lunar(wedDate.Day,mm: wedDate.Month, yy: wedDate.Year, timeZone: 7.0).0)/\(DateMacro.convertSolar2Lunar(wedDate.Day,mm: wedDate.Month, yy: wedDate.Year, timeZone: 7.0).1)" : "\(DateMacro.convertSolar2Lunar(wedDate.Day,mm: wedDate.Month, yy: wedDate.Year, timeZone: 7.0).0)"

        let lunarThur = DateMacro.convertSolar2Lunar(thurDate.Day,mm: thurDate.Month, yy: thurDate.Year, timeZone: 7.0).0 == 1 ? "\(DateMacro.convertSolar2Lunar(thurDate.Day,mm: thurDate.Month, yy: thurDate.Year, timeZone: 7.0).0)/\(DateMacro.convertSolar2Lunar(thurDate.Day,mm: thurDate.Month, yy: thurDate.Year, timeZone: 7.0).1)" : "\(DateMacro.convertSolar2Lunar(thurDate.Day,mm: thurDate.Month, yy: thurDate.Year, timeZone: 7.0).0)"

        let lunarFri = DateMacro.convertSolar2Lunar(friDate.Day,mm: friDate.Month, yy: friDate.Year, timeZone: 7.0).0 == 1 ? "\(DateMacro.convertSolar2Lunar(friDate.Day,mm: friDate.Month, yy: friDate.Year, timeZone: 7.0).0)/\(DateMacro.convertSolar2Lunar(friDate.Day,mm: friDate.Month, yy: friDate.Year, timeZone: 7.0).1)" : "\(DateMacro.convertSolar2Lunar(friDate.Day,mm: friDate.Month, yy: friDate.Year, timeZone: 7.0).0)"

        let lunarSat = DateMacro.convertSolar2Lunar(satDate.Day,mm: satDate.Month, yy: satDate.Year, timeZone: 7.0).0 == 1 ? "\(DateMacro.convertSolar2Lunar(satDate.Day,mm: satDate.Month, yy: satDate.Year, timeZone: 7.0).0)/\(DateMacro.convertSolar2Lunar(satDate.Day,mm: satDate.Month, yy: satDate.Year, timeZone: 7.0).1)" : "\(DateMacro.convertSolar2Lunar(satDate.Day,mm: satDate.Month, yy: satDate.Year, timeZone: 7.0).0)"

        let lunarSun = DateMacro.convertSolar2Lunar(sunDate.Day,mm: sunDate.Month, yy: sunDate.Year, timeZone: 7.0).0 == 1 ? "\(DateMacro.convertSolar2Lunar(sunDate.Day,mm: sunDate.Month, yy: sunDate.Year, timeZone: 7.0).0)/\(DateMacro.convertSolar2Lunar(sunDate.Day,mm: sunDate.Month, yy: sunDate.Year, timeZone: 7.0).1)" : "\(DateMacro.convertSolar2Lunar(sunDate.Day,mm: sunDate.Month, yy: sunDate.Year, timeZone: 7.0).0)"

        lunarMonLabel.text  = lunarMon
        lunarTueLabel.text  = lunarTue
        lunarWedLabel.text  = lunarWed
        lunarThurLabel.text = lunarThur
        lunarFriLabel.text  = lunarFri
        lunarSatLabel.text  = lunarSat
        lunarSunLabel.text  = lunarSun

        let firstDay    = currentDate.startOfMonth().timeIntervalSince1970
        let lastDay     = currentDate.endOfMonth().timeIntervalSince1970
        
        if mon < firstDay || mon > lastDay {
            mondayLabel.textColor = .lightGray
        } else {
            mondayLabel.textColor = .black
        }
        
        if tue < firstDay || tue > lastDay {
            tueLabel.textColor = .lightGray
        } else {
            tueLabel.textColor = .black
        }
        
        if wed < firstDay || wed > lastDay {
            wedLabel.textColor = .lightGray
        } else {
            wedLabel.textColor = .black
        }
        
        if thur < firstDay || thur > lastDay {
            thurLabel.textColor = .lightGray
        } else {
            thurLabel.textColor = .black
        }
        
        if fri < firstDay || fri > lastDay {
            friLabel.textColor = .lightGray
        } else {
            friLabel.textColor = .black
        }
        
        if sat < firstDay || sat > lastDay {
            satLabel.textColor = .lightGray
        } else {
            satLabel.textColor = .black
        }
        
        if sun < firstDay || sun > lastDay {
            sunLabel.textColor = .lightGray
        } else {
            sunLabel.textColor = .red
        }
        
        // Detect today
        if Date.init(timeIntervalSince1970: mon).isToday() {
            monView.backgroundColor = UIColor.init(hex: todayColor)
            lunarMonLabel.textColor = .white
        } else {
            monView.backgroundColor = .clear
            lunarMonLabel.textColor = .lightGray
        }
        
        if Date.init(timeIntervalSince1970: tue).isToday() {
            tueView.backgroundColor = UIColor.init(hex: todayColor)
            lunarTueLabel.textColor = .white
        } else {
            tueView.backgroundColor = .clear
            lunarTueLabel.textColor = .lightGray
        }
        
        if Date.init(timeIntervalSince1970: wed).isToday() {
            wedView.backgroundColor = UIColor.init(hex: todayColor)
            lunarWedLabel.textColor = .white
        } else {
            wedView.backgroundColor = .clear
            lunarWedLabel.textColor = .lightGray
        }
        
        if Date.init(timeIntervalSince1970: thur).isToday()  {
            thurView.backgroundColor = UIColor.init(hex: todayColor)
            lunarThurLabel.textColor = .white
        } else {
            thurView.backgroundColor = .clear
            lunarThurLabel.textColor = .lightGray
        }
        
        if Date.init(timeIntervalSince1970: fri).isToday() {
            friView.backgroundColor = UIColor.init(hex: todayColor)
            lunarFriLabel.textColor = .white
        } else {
            friView.backgroundColor = .clear
            lunarFriLabel.textColor = .lightGray
        }
        
        if Date.init(timeIntervalSince1970: sat).isToday() {
            satView.backgroundColor = UIColor.init(hex: todayColor)
            lunarSatLabel.textColor = .white
        } else {
            satView.backgroundColor = .clear
            lunarSatLabel.textColor = .lightGray
        }
        
        if Date.init(timeIntervalSince1970: sun).isToday() {
            sunView.backgroundColor = UIColor.init(hex: todayColor)
            lunarSunLabel.textColor = .white
        } else {
            sunView.backgroundColor = .clear
            lunarSunLabel.textColor = .lightGray
        }
    }
}
