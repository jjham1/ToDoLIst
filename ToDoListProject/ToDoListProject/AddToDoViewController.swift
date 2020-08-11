//
//  AddToDoViewController.swift
//  ToDoListProject
//
//  Created by Julie Ham on 8/10/20.
//  Copyright © 2020 Julie Ham. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
   
    var previousToDoTVC = ToDoTableViewController()
    
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var switchInput: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
       
        guard let accessToCoreData = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let dataFromCoreData = accessToCoreData.persistentContainer.viewContext
        
        let newToDo = ToDoCD(context: dataFromCoreData)
        
        newToDo.descriptionInCD = descriptionInput.text
        newToDo.importantInCD = switchInput.isOn
        
        accessToCoreData.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
        
        //let newToDo = ToDoClass()
        
       // if let checkForInput = descriptionInput.text{
           // newToDo.description = checkForInput
           // newToDo.important = switchInput.isOn
      //  }
        
       // previousToDoTVC.listOfToDo.append(newToDo)
        //previousToDoTVC.tableView.reloadData()
        //navigationController?.popViewController(animated: true)
   // }
    
}
