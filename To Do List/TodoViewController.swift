//
//  TodoViewController.swift
//  To Do List
//
//  Created by Simon Wilson on 06/12/2020.
//

import UIKit

class TodoViewController: UIViewController {
    
    @IBOutlet weak var todoTextField: UITextField!
    
    @IBOutlet weak var todoSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func addClicked(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let newTodo = ToDoItem(context: context)
            
            if let name = todoTextField.text {
                
                newTodo.name = name
                
                newTodo.important = todoSwitch.isOn
                
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                
                navigationController?.popViewController(animated: true)
                
                
            }
            
            
        }
        
    }
}
