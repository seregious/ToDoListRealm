//
//  DataManager.swift
//  ToDoListRealm
//
//  Created by Сергей Иванчихин on 10.05.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func createTempData(_ completion: @escaping() -> Void) {
        if !UserDefaults.standard.bool(forKey: "done") {
            UserDefaults.standard.set(true, forKey: "done")
            
            let shopingList = TaskList()
            shopingList.name = "Shoping List"
            
            let milk = Task()
            milk.name = "Milk"
            milk.note = "2L"
            
            let bread = Task(value: ["Bread", "", Date(), true])
            let apples = Task(value: ["name" : "Apples", "notes" : "2kg"])
            
            shopingList.tasks.append(milk)
            shopingList.tasks.insert(contentsOf: [bread, apples], at: 1)
            
            let moviesList = TaskList(value: ["Movies List", Date(), [["Best film ever"], ["The best of the best", "Must have", Date(), true]]])
            
            DispatchQueue.main.async {
                StorageManager.shared.save([shopingList, moviesList])
                completion()
            }
            
            }
    }
}
