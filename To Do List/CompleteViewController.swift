//
//  CompleteViewController.swift
//  To Do List
//
//  Created by Simon Wilson on 06/12/2020.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var todo = ToDo()

    @IBOutlet weak var completeLabel: UILabel!
    
    var toTableVc : TodoTableViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if todo.important {
            
            completeLabel.text = "❗️" + todo.name
            
        } else {
            
            completeLabel.text = todo.name
            
        }
        
    }
    
    @IBAction func completeClicked(_ sender: Any) {
        
        if let todos = toTableVc?.toDos {
            
            var index = 0
            
            for x in todos {
                
                if x.name == todo.name {
                    
                    toTableVc?.toDos.remove(at: index)
                    
                    toTableVc?.tableView.reloadData()
                    
                    navigationController?.popViewController(animated: true)
                    
                    return
                    
                }
                
                index += 1
                
            }
            
        }
        
    }
    
}
