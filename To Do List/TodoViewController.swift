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
        
        let newTodo = ToDo()
        
        if let name = todoTextField.text {
            
            newTodo.name = name
            
            newTodo.important = todoSwitch.isOn
            
        }
        
        
        
    }
}
