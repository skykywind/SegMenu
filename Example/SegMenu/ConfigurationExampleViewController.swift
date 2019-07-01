//
//  ConfigurationExampleViewController.swift
//  SegMenu_Example
//
//  Created by 贾富佳 on 2019/6/28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SegMenu

class ConfigurationExampleViewController: UIViewController {

    var segMenu: SegMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegMenu()
    }
    
    func setupSegMenu() {
        //Create controllers
        let colors = [UIColor.black, UIColor.blue, UIColor.red, UIColor.gray, UIColor.green, UIColor.purple, UIColor.orange, UIColor.brown, UIColor.cyan]
        let controllers = colors.map { (color: UIColor) -> UIViewController in
            let controller = UIViewController()
            controller.view.backgroundColor = color
            return controller
        }
        
        //Create page menu
        segMenu = SegMenu(viewControllers: controllers, in: self, with: dummyConfiguration())
        segMenu?.view.frame = CGRect(x: 0, y: 84, width: view.bounds.width, height: view.bounds.height - 84)
    }
    
    func dummyConfiguration() -> SegMenuConfiguration {
        let configuration = SegMenuConfiguration()
        
        return configuration
    }

}
