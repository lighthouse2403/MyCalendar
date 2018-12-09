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
    var currentTimeInterval = Date().timeIntervalSince1970
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNavigationBar()
    }
    
    // MARK Setup UI
    func setupUI() {
        tableView.register(UINib.init(nibName: "MonthCalendarTableViewCell", bundle: nil), forCellReuseIdentifier: "MonthCalendarTableViewCell")
        tableView.isScrollEnabled   = false
    }
    
    func setupNavigationBar() {
        self.title  = "Calendar"
    }
    
    // MARK: - UITableView Delegate, Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonthCalendarTableViewCell") as! MonthCalendarTableViewCell
        
        return cell
    }
    
}
