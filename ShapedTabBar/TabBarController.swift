//
//  TabBarController.swift
//  ShapedTabBar
//
//  Created by Greener Chen on 2020/12/10.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    enum Tab: Int, CaseIterable {
        case home = 0
        case compose
        case profile
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTabItems()
    }
    
    private func setupTabItems() {
        guard let viewControllers = viewControllers else { return }
        for (index, vc) in viewControllers.enumerated() {
            switch index {
            case Tab.home.rawValue:
                vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house.fill"), tag: Tab.home.rawValue)
            case Tab.compose.rawValue:
                vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "plus.circle.fill"), tag: Tab.compose.rawValue)
            case Tab.profile.rawValue:
                vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person.crop.circle.fill"), tag: Tab.profile.rawValue)
            default:
                break
            }
        }
        
    }

}
