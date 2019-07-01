//
//  SimpleExampleViewController.swift
//  SegMenu_Example
//
//  Created by 贾富佳 on 2019/6/28.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import SegMenu

class SimpleExampleViewController: UIViewController {

    var menu: SegMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenu()
    }
    
    private func setupMenu() {
        //Create controllers
        let colors = [UIColor.black, UIColor.blue, UIColor.red, UIColor.gray, UIColor.green, UIColor.purple, UIColor.orange, UIColor.brown, UIColor.cyan]
        let controllers: [UIViewController] = colors.map {
            let controller = UIViewController()
            controller.view.backgroundColor = $0
            return controller
        }
        
        //Create page menu
        menu = SegMenu(viewControllers: controllers, in: self, with: dummyConfiguration(), usingStoryboards: true)

        menu?.view.frame = CGRect(x: 0, y: 84, width: view.bounds.width, height: view.bounds.height - 84)
    }
    
    private func dummyConfiguration() -> SegMenuConfiguration {
        let configuration = SegMenuConfiguration()
        configuration.enableHorizontalBounce = false
        return configuration
    }

}
