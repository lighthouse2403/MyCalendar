//
//  MonthCalendarViewController.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 11/29/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class MonthCalendarViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    var currentDate: Date!
    var datesArray          = [[Double]]()
    var lunarDateArray      = [[Double]]()
    var numberOfWeek        = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getDates()
        self.setupUI()
        tableHeight.constant = CGFloat(numberOfWeek * 50)

        print("View will appear")
    }
    // MARK Setup UI
    func setupUI() {
        tableView.register(UINib.init(nibName: "MonthCalendarTableViewCell", bundle: nil), forCellReuseIdentifier: "MonthCalendarTableViewCell")
        tableView.isScrollEnabled   = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - UITableView Delegate, Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datesArray.first?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
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
                       currentDate: currentDate)
        return cell
    }
    
    // MARK: Get dates of this month
    func getDates() {
        datesArray = DateMacro.generateDatesOfMonth(currentDate: currentDate)
        numberOfWeek = datesArray.first?.count ?? 0
        tableView.reloadData()
        print(datesArray.description)
    }
}


