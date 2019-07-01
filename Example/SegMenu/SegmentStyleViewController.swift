//
//  SegmentStyleViewController.swift
//  SegMenu_Example
//
//  Created by 贾富佳 on 2019/7/1.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SegMenu

class SegmentStyleViewController: UIViewController {
    
    var segMenu: SegMenu?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegMenu()
    }
    
    func setupSegMenu() {
        //Create controllers
        let colors = [UIColor.black, UIColor.blue, UIColor.red]
        var controllers = [UIViewController]()
        for (index, color) in colors.enumerated() {
            let controller = UIViewController()
            controller.title = "Segment \(index+1)"
            controller.view.backgroundColor = color
            controllers.append(controller)
        }
        
        //Create page menu
        segMenu = SegMenu(viewControllers: controllers, frame: CGRect(x: 0, y: 84, width: view.bounds.width, height: view.bounds.height - 84), pageMenuOptions: options())
        view.addSubview(segMenu!.view)
    }
    
    func options() -> [SegMenuOption] {
        return [
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(.white),
            .bottomMenuHairlineColor(UIColor(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 0.1)),
            .indicatorColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .menuHeight(50.0),
            .selectedMenuItemTextColor(UIColor(red: 18.0/255.0, green: 150.0/255.0, blue: 225.0/255.0, alpha: 1.0)),
            .unselectedMenuItemTextColor(UIColor(red: 40.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)),
            .menuItemFont(UIFont(name: "Noteworthy-Light", size: 15.0)!),
            .useMenuAsSegmentedControl(true),
            .menuItemSeparatorRoundEdges(true),
            .indicatorHeight(2.0),
            .menuItemSeparatorWidth(5),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
    }
}
