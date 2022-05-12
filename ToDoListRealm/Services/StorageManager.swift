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
    
    func save(_ taskList: [TaskList]) {
        try! realm.write {
            realm.add(taskList)
        }
    }
}
