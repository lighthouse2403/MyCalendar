//
//  ChangeDateViewController.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 11/29/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class ChangeDateViewController: UIViewController {
    @IBOutlet weak var calendarDatePicker: UIDatePicker!
    @IBOutlet weak var lunarDatePicker: UIDatePicker!
    
    // MARK: - Variable Calendar
    var yearArray   = [Int]()
    var monthArray  = [1,2,3,4,5,6,7,8,9,10,11,12]
    var dateArray   = [Int]()
    
    // MARK: - Variable Lunar Calendar
    var lunarDateArray   = [Int]()
    var lunarMonthArray  = [1,2,3,4,5,6,7,8,9,10,11,12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: Set up UI
    func setupUI() {
        calendarDatePicker.datePickerMode = .date
        calendarDatePicker.setDate(Date(), animated: false)
        calendarDatePicker.locale = Locale.init(identifier: "vi_VN")
        
        lunarDatePicker.datePickerMode = .date
        lunarDatePicker.setDate(Date(), animated: false)
        lunarDatePicker.locale = Locale.init(identifier: "vi_VN")
        lunarDatePicker.calendar = Calendar.init(identifier: .chinese)
    }
    
    func defaultVariable() {
        // Get 200 years
        for index in 0...200 {
            yearArray.append(1900 + index)
        }
        
        // Get number of month for current year
        // First day of month 11
        let a11 = DateMacro.getLunarMonth11(Date().Year, timeZone: 7)

        let leapMonth = DateMacro.getLeapMonthOffset(a11, timeZone: 7) - 2
        if DateMacro.detectLeapYear(year: Date().Year) {
            lunarMonthArray.append(leapMonth)
            lunarMonthArray.sort()
        }
    }
}
