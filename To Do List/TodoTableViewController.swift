//
//  TodoTableViewController.swift
//  To Do List
//
//  Created by Simon Wilson on 06/12/2020.
//

import UIKit

class TodoTableViewController: UITableViewController {
    
    var toDos : [ToDoItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataToDoItems =  try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                
                toDos = coreDataToDoItems
                
                tableView.reloadData()
                
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if toDos[indexPath.row].important {
            
            if let name = toDos[indexPath.row].name {
            
            cell.textLabel?.text = "❗️" + name
            
        }
            
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
        
        if let completeVc = segue.destination as? CompleteViewController {
            
            if let todo = sender as? ToDoItem {
                
                completeVc.todo = todo
                
            }
            
            
            
        }
        
    }
    
}
