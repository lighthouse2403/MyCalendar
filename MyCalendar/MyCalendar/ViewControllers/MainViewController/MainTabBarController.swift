//
//  MainTabBarController.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 11/30/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let navigation1 = self.setupController(DateCalendarViewController(),
                                               tabName: "Lịch ngày",
                                               image: IMAGE(""),
                                               selectedImage: IMAGE(""))
        
        let navigation2 = self.setupController(MonthCalendarViewController(),
                                               tabName: "Lịch tháng",
                                               image: IMAGE(""),
                                               selectedImage: IMAGE(""))
        
        let navigation3 = self.setupController(ChangeDateViewController(),
                                               tabName: "Đổi ngày",
                                               image: IMAGE(""),
                                               selectedImage: IMAGE(""))
        
        let navigation4 = self.setupController(MoreViewController(),
                                               tabName: "Mở rộng",
                                               image: IMAGE(""),
                                               selectedImage: IMAGE(""))
        
        
        self.viewControllers = [ navigation1, navigation2, navigation3, navigation4]
        
        self.tabBar.backgroundColor = MThemes.current.tabBarBackgroundColor()
    }
    

    func setupController(_ viewController: UIViewController, tabName: String, image: UIImage, selectedImage: UIImage) -> BaseNavigationController {
        let normalAttributes: PKEYS = [ NSAttributedStringKey.foregroundColor : MThemes.current.tabBarTextColor(),
                                        NSAttributedStringKey.font : FONT_REGULAR(12.0) ]
        
        let tabbarItem = UITabBarItem(title: tabName,
                                      image: image.withRenderingMode(.alwaysOriginal),
                                      selectedImage: selectedImage.withRenderingMode(.alwaysOriginal))
        tabbarItem.setTitleTextAttributes(normalAttributes, for: .normal)
        tabbarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0)
        tabbarItem.titlePositionAdjustment = UIOffsetMake(0, -5)
        
        viewController.tabBarItem = tabbarItem
        return BaseNavigationController(rootViewController: viewController)
    }

}
