//
//  CompleteViewController.swift
//  To Do List
//
//  Created by Simon Wilson on 06/12/2020.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var todo : ToDoItem? = nil
    
    @IBOutlet weak var completeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if todo != nil {
            
            if todo!.important {
                
                if let name = todo?.name {
                
                completeLabel.text = "❗️" + name
                    
                }
                
            } else {
                
                completeLabel.text = todo!.name
                
            }
            
        }
        
    }
    
    @IBAction func completeClicked(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if todo != nil {
                
                context.delete(todo!)
                
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                
                navigationController?.popViewController(animated: true)
                
            }
            
        }
        
//        if let todos = toTableVc?.toDos {
//
//            var index = 0
//
//            for x in todos {
//
//                if x.name == todo.name {
//
//                    toTableVc?.toDos.remove(at: index)
//
//                    toTableVc?.tableView.reloadData()
//
//                    navigationController?.popViewController(animated: true)
//
//                    return
//
//                }
//
//                index += 1
//
//            }
            
//        }
        
    }
    
}
