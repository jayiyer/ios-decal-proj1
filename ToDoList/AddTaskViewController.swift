//
//  TaskDetailsViewController.swift
//  TodoList
//
//  Created by Jay Iyer on 2/27/16.
//  Copyright © 2016 Jay Iyer. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    var task: Task?
    
    @IBOutlet var saveTask: UIBarButtonItem!
    @IBOutlet var taskTextField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender !== self.saveTask ) {
            return
        }
        if (taskTextField.text!.characters.count > 0 ) {
            task = Task(taskName: taskTextField.text!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
