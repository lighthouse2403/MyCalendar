//
//  MonthCalendarViewController.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 11/29/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class MonthCalendarViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var currentDate         = Date()
    var datesArray          = [[Double]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNavigationBar()
        self.getDates()
    }
    
    // MARK Setup UI
    func setupUI() {
        tableView.register(UINib.init(nibName: "MonthCalendarTableViewCell", bundle: nil), forCellReuseIdentifier: "MonthCalendarTableViewCell")
        tableView.isScrollEnabled   = false
    }
    
    func setupNavigationBar() {
        self.title  = "Tháng 12"
    }
    
    // MARK: - UITableView Delegate, Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonthCalendarTableViewCell") as! MonthCalendarTableViewCell

        cell.setupDate(mon: datesArray[1][indexPath.row],
                       tue: datesArray[2][indexPath.row],
                       wed: datesArray[3][indexPath.row],
                       thur: datesArray[4][indexPath.row],
                       fri: datesArray[5][indexPath.row],
                       sat: datesArray[6][indexPath.row],
                       sun: datesArray[0][indexPath.row],
                       lastDay: currentDate.endOfMonth().timeIntervalSince1970,
                       firstDay: currentDate.startOfMonth().timeIntervalSince1970)
        return cell
    }
    
    // MARK: Get dates of this month
    func getDates() {
        datesArray = DateMacro.generateDatesOfMonth(currentDate: currentDate)
        print(datesArray.description)
    }
}
