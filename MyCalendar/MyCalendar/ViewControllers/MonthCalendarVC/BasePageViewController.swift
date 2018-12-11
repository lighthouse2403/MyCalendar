//
//  BasePageViewController.swift
//  MyCalendar
//
//  Created by Dang Nguyen on 12/10/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class BasePageViewController: BaseViewController {

    var pageViewController: UIPageViewController!
    var currentDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupPageViewController()
        // Do any additional setup after loading the view.
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isTranslucent = false
        self.title = "\(currentDate.stringFromDate(format: "MM-yyyy"))"
    }
    
    private func setupPageViewController() {
        let monthCalendarViewController = MonthCalendarViewController()
        monthCalendarViewController.currentDate = currentDate
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.setViewControllers([monthCalendarViewController], direction: .forward, animated: true, completion: nil)
        pageViewController.view.backgroundColor = .clear
        pageViewController.delegate     = self
        pageViewController.dataSource   = self
        view.addSubview(pageViewController.view)
        view.setNeedsLayout()
    }
}

extension BasePageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished, completed {
            print("finished")
            self.setupNavigationBar()

        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let monthCalendarViewController = MonthCalendarViewController()
        monthCalendarViewController.currentDate = currentDate.previousMonth()
        currentDate = monthCalendarViewController.currentDate
        return monthCalendarViewController
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let monthCalendarViewController = MonthCalendarViewController()
        monthCalendarViewController.currentDate = currentDate.nextMonth()

        currentDate = monthCalendarViewController.currentDate

        return monthCalendarViewController
    }
}
