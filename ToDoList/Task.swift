//
//  Task.swift
//  TodoList
//
//  Created by Jay Iyer on 2/27/16.
//  Copyright © 2016 Jay Iyer. All rights reserved.
//

import UIKit

struct Task {
    var taskName: String?
    var completed = false

    init(taskName: String?) {
        self.taskName = taskName
    }
}