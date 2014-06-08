//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Soc Sieng on 7/06/2014.
//  Copyright (c) 2014 springsoftware. All rights reserved.
//

import UIKit
import Foundation

class ToDoListViewController : UITableViewController {
    var toDoItems: ToDoItem[]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialData()
    }
    
    @IBAction func unwindToList(segeue: UIStoryboardSegue) {
        var source = segeue.sourceViewController as AddToDoItemViewController
        
        if let item = source.toDoItem {
            var items = toDoItems!
            items.append(item)
            toDoItems = items
            
            tableView.reloadData()
        }
    }
    
    func loadInitialData() {
        let itemNames = ["Buy milk", "Buy eggs", "Go shopping"]
        var items = ToDoItem[]()
        
        for name in itemNames {
            let item = ToDoItem()
            item.itemName = name
            items.append(item)
        }
        
        toDoItems = items
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems!.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as UITableViewCell
        let toDoItem = toDoItems![indexPath.row]
        cell.textLabel.text = toDoItem.itemName
        
        if toDoItem.completed {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var item = toDoItems![indexPath.row]
        item.completed = !item.completed
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
}