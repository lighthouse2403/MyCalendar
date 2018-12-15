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
    
    // MARK: - Set up UI
    func setupNavigationBar() {
        self.addRightBarItem(imageName: "", imageTouch: "", title: "Next")
        self.addLeftBarItem(imageName: "", title: "Back")
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor.init(hex: todayColor)
        self.customTitle(title: "\(currentDate.stringFromDate(format: "MM-yyyy"))")
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
    
    // MARK: - Action
    override func tappedLeftBarButton(sender: UIButton) {
        let beforeMonthViewController = pageViewController.viewControllers?.last as? MonthCalendarViewController
        
        let monthCalendarViewController = MonthCalendarViewController()
        monthCalendarViewController.currentDate = beforeMonthViewController?.currentDate.previousMonth()
        self.currentDate = monthCalendarViewController.currentDate ?? Date()
        self.setupNavigationBar()

        pageViewController.setViewControllers([monthCalendarViewController], direction: .forward, animated: true, completion: nil)
        
    }

    override func tappedRightBarButton(sender: UIButton) {
        let afterMonthViewController = pageViewController.viewControllers?.last as? MonthCalendarViewController

        let monthCalendarViewController = MonthCalendarViewController()
        monthCalendarViewController.currentDate = afterMonthViewController?.currentDate.nextMonth()
        self.currentDate = monthCalendarViewController.currentDate ?? Date()
        self.setupNavigationBar()

        pageViewController.setViewControllers([monthCalendarViewController], direction: .forward, animated: true, completion: nil)
        
    }
}

extension BasePageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            let monthCalendarViewController = pageViewController.viewControllers?.last as? MonthCalendarViewController
            self.currentDate = monthCalendarViewController?.currentDate ?? Date()
            self.setupNavigationBar()
        }
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let beforeMonthViewController = viewController as? MonthCalendarViewController else{return nil}

        let monthCalendarViewController = MonthCalendarViewController()
        monthCalendarViewController.currentDate = beforeMonthViewController.currentDate.previousMonth()

        return monthCalendarViewController
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let afterMonthViewController = viewController as? MonthCalendarViewController else{return nil}
        
        let monthCalendarViewController = MonthCalendarViewController()
        monthCalendarViewController.currentDate = afterMonthViewController.currentDate.nextMonth()
        return monthCalendarViewController
    }
}
