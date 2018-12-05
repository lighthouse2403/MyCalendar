//
//  MainViewController.swift
//  MyCalendar
//
//  Created by ThuyPH on 5/31/18.
//  Copyright © 2018 themask. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var bannerView: UIView!
    let tabBar = MainTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Configure layout
        tabBar.view.translatesAutoresizingMaskIntoConstraints = false
        tabBar.delegate = self
        self.addChildViewController(tabBar)
        self.view.addSubview(tabBar.view)
        tabBar.didMove(toParentViewController: self)
        
        let views: PJSON = [ "tabBarView" : tabBar.view,
                             "bannerView" : bannerView ]
        
        let constraint1 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tabBarView]-0-|", options: [], metrics: nil, views: views)
        let constraint2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tabBarView]-0-[bannerView]", options: [], metrics: nil, views: views)
        
        var constraints = [NSLayoutConstraint]()
        constraints += constraint1
        constraints += constraint2
        
        NSLayoutConstraint.activate(constraints)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}
