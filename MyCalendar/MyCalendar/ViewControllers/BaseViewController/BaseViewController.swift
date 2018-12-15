//
//  BaseViewController.swift
//  MyCalendar
//
//  Created by ThuyPH on 5/31/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /* Disable extended layout for all edges */
    func disableExtendedLayout(isDisable: Bool = true) {
        if (isDisable) {
            self.edgesForExtendedLayout = []
            // self.extendedLayoutIncludesOpaqueBars = false
        } else {
            self.edgesForExtendedLayout = .all
        }
    }

    //MARK: - UINavigation Bar
    func addLeftBarItem(imageName : String, title : String) {
        let leftButton = UIButton.init(type: UIButtonType.custom)
        leftButton.isExclusiveTouch = true
        leftButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        leftButton.addTarget(self, action: #selector(tappedLeftBarButton(sender:)), for: UIControlEvents.touchUpInside)
        if title.count > 0 {
            leftButton.frame = CGRect.init(x: 0, y: 0, width: 80, height: 30)
            leftButton.setTitle(title, for: UIControlState.normal)
        }
        if imageName.count > 0 {
            leftButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
            leftButton.setImage(UIImage.init(named: imageName), for: UIControlState.normal)
        }
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftButton)
    }
    
    func addRightBarItem(imageName : String, imageTouch: String, title : String) {
        let rightButton = UIButton.init(type: UIButtonType.custom)
        rightButton.isExclusiveTouch = true
        rightButton.addTarget(self, action: #selector(tappedRightBarButton(sender:)), for: UIControlEvents.touchUpInside)
        if title.count > 0 {
            rightButton.frame = CGRect.init(x: 0, y: 0, width: 80, height: 80)
            rightButton.setTitle(title, for: UIControlState.normal)
            rightButton.setupBorder()
        }
        if imageName.count > 0 {
            rightButton.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
            rightButton.setImage(UIImage.init(named: imageName), for: UIControlState.normal)
        }
        if imageTouch.count > 0 {
            rightButton.setImage(UIImage.init(named: imageTouch), for: .selected)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightButton)
    }
    
    func addTitleNavigation(title : String) {
        var widthValue = SCREEN_WIDTH - 120
        
        if self.navigationItem.rightBarButtonItem != nil && self.navigationItem.leftBarButtonItem != nil {
            widthValue = SCREEN_WIDTH - ((self.navigationItem.rightBarButtonItem?.customView?.frame.width)! + (self.navigationItem.leftBarButtonItem?.customView?.frame.width)!) - 100
        }
        
        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: widthValue, height: 44))
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.text = title
        titleLabel.numberOfLines = 2
        
        self.navigationItem.titleView = titleLabel
    }
    
    func addButtonTitle(title : String) {
        let titleButton = UIButton.init(type: .custom)
        titleButton.isExclusiveTouch = true
        titleButton.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH - 120, height: 44)
        titleButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        titleButton.titleLabel?.numberOfLines = 2
        titleButton.setTitle(title, for: .normal)
        titleButton.addTarget(self, action: #selector(tappedTitleButton), for: .touchUpInside)
        self.navigationItem.titleView = titleButton
    }
    
    func customTitle(title: String) {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 24)
        ]
        self.title = title
    }
    
    func pushUpViewController(_ viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionMoveIn;
        transition.subtype = kCATransitionFromTop;
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.pushViewController(viewController, animated: false)
    }
    
    func popDownViewController() -> Void {
        self.view.endEditing(true)
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal;
        transition.subtype = kCATransitionFromBottom;
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
    }
    
    //MARK: - Action
    @objc func tappedLeftBarButton(sender : UIButton) {
        
    }
    
    @objc func tappedRightBarButton(sender : UIButton) {
        
    }
    
    @objc func tappedTitleButton() {
        
    }

}
