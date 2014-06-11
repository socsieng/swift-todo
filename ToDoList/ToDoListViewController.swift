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
    @IBOutlet var editButton : UIBarButtonItem
    var toDoItems: ToDoItem[] = ToDoItem[]()
    var selectedIndex: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialData()
    }
    
    override func editButtonItem() -> UIBarButtonItem! {
        return editButton
    }
    
    @IBAction func editButtonSelected(sender : AnyObject) {
        setEditing(!editing, animated: true)
    }
    
    @IBAction func unwindToList(segeue: UIStoryboardSegue) {
        var source = segeue.sourceViewController as AddToDoItemViewController
        
        if editing && selectedIndex && source.toDoItem {
            var item = toDoItems[selectedIndex!.row]
            item.itemName = source.toDoItem!.itemName
            tableView.reloadRowsAtIndexPaths([selectedIndex!], withRowAnimation: UITableViewRowAnimation.None)
            selectedIndex = nil
        } else if let item = source.toDoItem {
            toDoItems.append(item)
            
            tableView.reloadData()
        }
    }
    
    func loadInitialData() {
        let itemNames = ["Buy milk", "Buy eggs", "Go shopping"]
        toDoItems.removeAll(keepCapacity: false)
        
        for name in itemNames {
            let item = ToDoItem()
            item.itemName = name
            toDoItems.append(item)
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as UITableViewCell
        let toDoItem = toDoItems[indexPath.row]
        cell.textLabel.text = toDoItem.itemName
        
        if toDoItem.completed {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var item = toDoItems[indexPath.row]
        
        if editing {
            var viewController = storyboard.instantiateViewControllerWithIdentifier("AddToDoItem") as AddToDoItemViewController
            selectedIndex = indexPath
            viewController.toDoItem = item
            navigationController.pushViewController(viewController, animated: true)
        } else {
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            item.completed = !item.completed
            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
        }
    }
}