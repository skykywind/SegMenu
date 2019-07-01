//
//  OptionsViewController.swift
//  SegMenu_Example
//
//  Created by 贾富佳 on 2019/7/1.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SegMenu

class OptionsViewController: UIViewController {
    var segMenu: SegMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegMenu()
    }
    
    func setupSegMenu() {
        //Create controllers
        let colors = [UIColor.black, UIColor.blue, UIColor.red, UIColor.gray, UIColor.green, UIColor.purple, UIColor.orange, UIColor.brown, UIColor.cyan]
        let titles = ["News", "Sports", "Fashion", "Financial", "Technology", "Entertainment", "Favorites", "Food", "International News"]
        var controllers = [UIViewController]()
        for (i, color) in colors.enumerated() {
            let controller = UIViewController()
            controller.view.backgroundColor = color
            controller.title = titles[i]
            controllers.append(controller)
        }
        
        //Create page menu
        segMenu = SegMenu(viewControllers: controllers, frame: CGRect(x: 0, y: 84, width: view.bounds.width, height: view.bounds.height - 84), pageMenuOptions: options())
        view.addSubview(segMenu!.view)
    }
    
    func options() -> [SegMenuOption] {
        return [
            .autoAdjustMenuItemWidthWithTitle(true),
            .scrollMenuBackgroundColor(UIColor.black),
            .viewBackgroundColor(.white),
            .bottomMenuHairlineColor(.orange),
            .indicatorColor(.orange),
            .menuMargin(20),
            .menuHeight(50.0),
            .selectedMenuItemTextColor(.orange),
            .unselectedMenuItemTextColor(.white),
            .menuItemFont(UIFont(name: "HelveticaNeue-Medium", size: 16.0)!),
            .indicatorHeight(2.0)
        ]
    }

}
