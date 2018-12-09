//
//  DateCalendarViewController.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 11/29/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class DateCalendarViewController: BaseViewController {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    
    @IBOutlet weak var lunarMonthLabel: UILabel!
    @IBOutlet weak var lunarDateLabel: UILabel!
    @IBOutlet weak var lunarYearLabel: UILabel!
    
    @IBOutlet weak var canChiLunarMonthLabel: UILabel!
    @IBOutlet weak var canChiLunarDateLabel: UILabel!
    @IBOutlet weak var canChiLunarTimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Lịch vạn niên"
        self.disableExtendedLayout()
        
        let date = Date()
        self.applyDate(date)
        
    }

    func applyDate(_ date: Date) {
        let component = DateMacro.getComponents(date)
        let (d,m,y) = (component.day ?? 0, component.month ?? 0, component.year ?? 0)
        monthLabel.text = "Tháng " + "\(m)" + " Năm " + "\(y)"
        dateLabel.text = "\(d)"
        dayOfWeekLabel.text =  DateMacro.dateToDayOfWeek(date: date)
        
        let (ld,lm,ly) = DateMacro.convertSolar2Lunar(d, mm: m, yy: y, timeZone: 7)
        
        lunarMonthLabel.text = "Tháng " + "\(lm)"
        lunarDateLabel.text = "\(ld)"
        lunarYearLabel.text = DateMacro.yearToCanChi(ly)
        
        canChiLunarMonthLabel.text = "Tháng " + DateMacro.monthToCanChi(lm, ly: ly)
        canChiLunarDateLabel.text = "Ngày " + DateMacro.dateToCanChi(d, mm: m, yy: y)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}
