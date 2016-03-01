//
//  StatsViewController.swift
//  TodoList
//
//  Created by Jay Iyer on 2/27/16.
//  Copyright © 2016 Jay Iyer. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {
    @IBOutlet var displayLabel: UILabel!
    
    var numCompletedTasks = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayLabel.text = String(numCompletedTasks) as String!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

