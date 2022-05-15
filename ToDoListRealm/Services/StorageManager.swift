//
//  StorageManager.swift
//  ToDoListRealm
//
//  Created by Сергей Иванчихин on 10.05.2022.
//

import RealmSwift

class StorageManager {
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    //MARK: -  TaskList
    
    func save(_ taskLists: [TaskList]) {
        write {
            realm.add(taskLists)
        }
    }
    
    
    func save(_ taskList: TaskList) {
        write {
            realm.add(taskList)
        }
    }
    
    //MARK: -  Task
    
    func save(_ task: Task, to taskList: TaskList) {
        write {
            taskList.tasks.append(task)
        }
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch let error {
            print(error)
        }
    }
}

// sd;kjfglsdkjglk
