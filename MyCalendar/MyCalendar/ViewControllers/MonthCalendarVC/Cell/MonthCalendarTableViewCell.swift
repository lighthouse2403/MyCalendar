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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func tappedDate(_ sender: UIButton) {
    }
    
    func setupDate(mon: Double, tue: Double, wed: Double, thur: Double, fri: Double, sat: Double, sun: Double, currentDate: Date) {
        mondayLabel.text    = "\(Date.init(timeIntervalSince1970: mon).Day)"
        tueLabel.text       = "\(Date.init(timeIntervalSince1970: tue).Day)"
        wedLabel.text       = "\(Date.init(timeIntervalSince1970: wed).Day)"
        thurLabel.text      = "\(Date.init(timeIntervalSince1970: thur).Day)"
        friLabel.text       = "\(Date.init(timeIntervalSince1970: fri).Day)"
        satLabel.text       = "\(Date.init(timeIntervalSince1970: sat).Day)"
        sunLabel.text       = "\(Date.init(timeIntervalSince1970: sun).Day)"
        
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
            sunLabel.textColor = .black
        }
        
    }
}
