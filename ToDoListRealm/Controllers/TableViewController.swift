//
//  TableViewController.swift
//  ToDoListRealm
//
//  Created by Сергей Иванчихин on 10.05.2022.
//

import RealmSwift
import UIKit

class TableViewController: UITableViewController {
    
    private var taskList: Results<TaskList>!

    override func viewDidLoad() {
        super.viewDidLoad()

        createTempData()
        taskList = StorageManager.shared.realm.objects(TaskList.self)
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        taskList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskID", for: indexPath)
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.name
        content.secondaryText = String(task.tasks.count)
        cell.contentConfiguration = content
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        guard let taskVC = segue.destination as? TaskViewController else {return}
        let task = taskList[indexPath.row]
        taskVC.task = task
    }

    private func createTempData() {
        DataManager.shared.createTempData {
            self.tableView.reloadData()
        }
    }
    
}

extension TableViewController {
    private func showAlert() {
        let alert = UIAlertController.createAlert(title: "New list", massage: "Please type the list name")
        
        alert.acton {list in
            self.save(list)
        }
        
        present(alert, animated: true)
        
    }
    
    private func save(_ taskList: String) {
        let taskList = TaskList(value: [taskList])
        StorageManager.shared.save(taskList)
        let rowIndex = IndexPath(row: taskList.index(of: taskList) ?? 0, section: 0)
        tableView.insertRows(at: [rowIndex], with: .automatic)
    }
}
