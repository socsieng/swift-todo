//
//  AddToDoItemViewController.swift
//  ToDoList
//
//  Created by Soc Sieng on 7/06/2014.
//  Copyright (c) 2014 springsoftware. All rights reserved.
//

import UIKit

class AddToDoItemViewController : UIViewController {
    var toDoItem : ToDoItem?
    
    @IBOutlet var textField : UITextField
    @IBOutlet var doneButton : UIBarButtonItem
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        if (sender as? NSObject != doneButton) {
            return
        }
        
        if (!textField.text.isEmpty) {
            var item = ToDoItem()
            item.itemName = textField.text
            item.completed = false
            toDoItem = item
        }
    }
}