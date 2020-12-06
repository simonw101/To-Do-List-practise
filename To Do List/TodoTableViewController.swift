//
//  TodoTableViewController.swift
//  To Do List
//
//  Created by Simon Wilson on 06/12/2020.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todo1 = ToDo()
        todo1.name = "Buy Milk"
        todo1.important = true
        toDos.append(todo1)
        
        let todo2 = ToDo()
        todo2.name = "Buy bread"
        todo2.important = false
        toDos.append(todo2)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if toDos[indexPath.row].important {
            
            cell.textLabel?.text = "❗️" + toDos[indexPath.row].name
            
        } else {
            
            cell.textLabel?.text = toDos[indexPath.row].name
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedToDO = toDos[indexPath.row]
        
        performSegue(withIdentifier: "goToComplete", sender: selectedToDO)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let toDoVC = segue.destination as? TodoViewController {
            
            toDoVC.toTableVc = self
            
        }
        
        if let completeVc = segue.destination as? CompleteViewController {
            
            if let todo = sender as? ToDo {
                
                completeVc.todo = todo
                completeVc.toTableVc = self
                
            }
            
            
            
        }
        
    }
    
}
