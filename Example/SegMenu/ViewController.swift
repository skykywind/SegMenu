//
//  ViewController.swift
//  SegMenu
//
//  Created by skykywind on 06/25/2019.
//  Copyright (c) 2019 skykywind. All rights reserved.
//

import UIKit
import SegMenu

class ViewController: UIViewController {

    var menu: SegMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageMenu()
    }
    
    func setupPageMenu() {
        let colors = [UIColor.black, UIColor.blue, UIColor.red, UIColor.gray, UIColor.green, UIColor.purple, UIColor.orange, UIColor.brown, UIColor.cyan]
        let controllers = colors.map { (color: UIColor) -> UIViewController in
            let controller = UIViewController()
            controller.view.backgroundColor = color
            return controller
        }
        
        menu = SegMenu(viewControllers: controllers, frame: CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height - 100), configuration: dummyConfiguration())
        view.addSubview(menu!.view)
    }
    
    func dummyConfiguration() -> SegMenuConfiguration {
        let configuration = SegMenuConfiguration()
        return configuration
    }
    
}

