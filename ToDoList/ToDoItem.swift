//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Soc Sieng on 7/06/2014.
//  Copyright (c) 2014 springsoftware. All rights reserved.
//

import Foundation

class ToDoItem {
    var _itemName: String = ""
    var _completed: Bool = false
    var _completionDate: NSDate = NSDate()
    var _creationDate: NSDate = NSDate()
    
    var itemName: String {
    get {
        return _itemName
    }
    set (value) {
        _itemName = value
    }
    }

    var completed: Bool {
    get {
        return _completed
    }
    set (value) {
        _completed = value
    }
    }
    
    var completionDate: NSDate {
    get {
        return _completionDate
    }
    }
    
    var creationDate: NSDate {
    get {
        return _completionDate
    }
    }
    
    func markAsCompleted (isComplete: Bool) {
        _completed = isComplete
    }
}