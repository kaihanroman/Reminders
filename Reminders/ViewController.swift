//
//  ViewController.swift
//  Reminders
//
//  Created by Kaihan Roman on 2/13/18.
//  Copyright © 2018 GT iOS Club. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var reminders = [Reminder]()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addReminder(_ sender: Any) {
        let alert = UIAlertController(title: "New Reminder", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: { textField in textField.placeholder = "Reminder"})
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in guard let input = alert.textFields?.first?.text, !input.isEmpty else
            {
                return
            }
        
            self.reminders.append(Reminder(title:input, completed: false))
            self.tableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style : .cancel))
        
        present(alert,animated: true)
    }
}

//MARK: Table View Delegate
//compartmentalizing extensions allows you to separate sections of your code
//just a convention; don't have to do this

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // "hey, how many rows should I have?"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count //"however many are in the array"
    }
    //"hey, i have a row i, what do I put in it?"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //"ya know, whatever"
        let index = indexPath.item
        let reminder = reminders[index]
        
        let cell = UITableViewCell()
        cell.textLabel?.text = reminder.title
        
        if reminder.completed {
            cell.accessoryType = .checkmark
            cell.textLabel?.alpha = 0.5
            
        } else {
            cell.accessoryType = .none
            cell.textLabel?.alpha = 1.0
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.item
        
        reminders[index].toggleCompleted()
        tableView.reloadData()
        }
}

