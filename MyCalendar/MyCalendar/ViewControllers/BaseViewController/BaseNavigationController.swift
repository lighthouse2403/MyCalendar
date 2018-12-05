//
//  BaseNavigationController.swift
//  MyCalendar
//
//  Created by Phan Hong Thuy on 11/29/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    var backButtonRef: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - Style
    
    func customStyle() {
        // Black background
        let attributes: PKEYS = [
            NSAttributedStringKey.foregroundColor : MThemes.current.navigationTitleColor(),
            NSAttributedStringKey.font : MThemes.current.navigationTitleFont()
        ]
        let backgroundImage = MThemes.current.navigationBackgroundImage()
        
        self.navigationBar.setBackgroundImage(backgroundImage, for: .default)
        self.navigationBar.titleTextAttributes = attributes
        self.navigationBar.backgroundColor = MThemes.current.navigationBackgroundColor()
        
//        self.navigationBar.shadowImage = IMAGE("navigation_shadow")
    }
    
    
    // MARK: - Custom back button
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        var isCustomBackButton: Bool = false
        var isCustomBackButtons: Bool = false
        var hasBackButton: Bool = false
        
        if let navigationItem = viewController.navigationController?.navigationItem {
            hasBackButton = viewController.navigationController!.viewControllers.count > 1
            isCustomBackButton = navigationItem.leftBarButtonItem != nil
            if (navigationItem.leftBarButtonItems != nil) {
                isCustomBackButtons = navigationItem.leftBarButtonItems!.count > 0
            }
        }
        
        if !isCustomBackButton && !isCustomBackButtons && hasBackButton {
            self.backButtonRef = self.backButtonItem()
            viewController.navigationItem.leftBarButtonItem = self.backButtonRef
        }
    }
    
    func replaceBackButton() {
        self.navigationItem.leftBarButtonItem = self.backButtonItem()
    }
    
    func backButtonItem() -> UIBarButtonItem {
        // Create new back button
        let leftButton = UIButton(frame: CGRect (x: 0, y: 0, width: 15, height: 32))
        leftButton.setImage(MThemes.current.navigationBackImage(), for: .normal)
        leftButton.addTarget(self, action: #selector(backButton_Clicked(_:)), for: .touchUpInside)
        leftButton.contentMode = .left
        leftButton.isMultipleTouchEnabled = false
        leftButton.isExclusiveTouch = true
        
        // Override back button
        return UIBarButtonItem(customView: leftButton)
    }
    
    @objc func backButton_Clicked(_ button: UIButton) {
        
        self.popViewController(animated: true)
    }
    
    
    // MARK: - StatusBar style
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}
