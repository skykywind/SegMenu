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

    @IBOutlet weak var table: UITableView!
    
    let titles = ["Simple Example", "Configuration Example", "Options Example", "Segment Style Example"]
    
    lazy var controllers = [SimpleExampleViewController(), ConfigurationExampleViewController(), OptionsViewController(), SegmentStyleViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(controllers[indexPath.row], animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "exampleCells.identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
            cell?.accessoryType = .disclosureIndicator
            cell?.textLabel?.text = titles[indexPath.row]
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
