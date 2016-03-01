//
//  TaskViewController.swift
//  TodoList
//
//  Created by Jay Iyer on 2/27/16.
//  Copyright © 2016 Jay Iyer. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    var tasks = [Task]()
    var numCompletedTasks = 0;
    @IBOutlet var statsButton: UIBarButtonItem!
    var dateCreated = NSDate()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath)
        let task = tasks[indexPath.row] as Task
        cell.textLabel?.text = task.taskName
        
        if (task.completed) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)

        tasks[indexPath.row].completed = !tasks[indexPath.row].completed
        if (tasks[indexPath.row].completed) {
            self.numCompletedTasks += 1
        } else {
            self.numCompletedTasks -= 1
        }

        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
    
 

    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if (segue.identifier == "fromStats") {
            return
        }
        
        let source = segue.sourceViewController as! AddTaskViewController
        let task = source.task as Task!
        
        if ((task) != nil) {
            tasks.append(task)
            self.tableView.reloadData()
        }
    }
    

    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            tasks.removeAtIndex(indexPath.row)
            //self.numCompletedTasks -= 1
            self.tableView.reloadData()
        }
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier != "Add") {
            let nav = segue.destinationViewController as! UINavigationController
            let dest = nav.topViewController as! StatsViewController
            dest.numCompletedTasks = self.numCompletedTasks
        }
        
        if (segue.identifier == "StatsSegue") {
            let dateNow = NSDate()
            let interval = dateNow.timeIntervalSinceDate(dateCreated)
            if (interval >= 86400) {
                self.numCompletedTasks = 0;
                let nav = segue.destinationViewController as! UINavigationController
                let dest = nav.topViewController as! StatsViewController
                dest.numCompletedTasks = self.numCompletedTasks
                self.dateCreated = NSDate()

            }
        }
    }
}