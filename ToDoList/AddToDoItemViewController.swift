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
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        
        toDoItem = nil
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (sender !== doneButton) {
            toDoItem = nil
            return
        }
        
        if (!textField.text.isEmpty) {
            var item = ToDoItem()
            item.itemName = textField.text
            item.completed = false
            toDoItem = item
        }
    }
    
    override func viewDidLoad() {
        if let item = toDoItem {
            textField.text = item.itemName
        }
    }
}