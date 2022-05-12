//
//  TaskList.swift
//  ToDoListRealm
//
//  Created by Сергей Иванчихин on 10.05.2022.
//

import RealmSwift

class TaskList: Object {
    @objc dynamic var name = ""
    @objc dynamic var date = Date()
    let tasks = List<Task>()
}

class Task: Object {
    @objc dynamic var name = ""
    @objc dynamic var note = ""
    @objc dynamic var data = Date()
    @objc dynamic var isComplete = false
}
