//
//  EmployeeViewModel.swift
//  CoreDataInSwiftUI
//
//  Created by Suneet  Agrawal on 04/08/23.
//

import Foundation
import CoreData

class EmployeeViewModel: ObservableObject {
    
    var context: NSPersistentContainer
    @Published var employeeEntity: [EmployeeEntity] = []
    
    init(){
        context = NSPersistentContainer(name: "EmployeeModel")
        context.loadPersistentStores { description, error in
            if let error = error {
                print("error loading: \(error)")
            }
        }
        fetchData()
    }
}

//MARK: CoreData Methods
extension EmployeeViewModel {
    
    func fetchData() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        do {
            employeeEntity = try context.viewContext.fetch(request)
        } catch (let error) {
            print("error fetching: \(error)")
        }
    }
    
    func addData(name: String,
                 id: Int16) {
        let newEmployee = EmployeeEntity(context: context.viewContext)
        newEmployee.id = id
        newEmployee.name = name
        self.saveData()
    }
    
    func saveData() {
        do {
            try context.viewContext.save()
        } catch (let error) {
            print("error saving: \(error)")
        }
        self.fetchData()
    }
    
    func deleteData(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = employeeEntity[index]
        context.viewContext.delete(entity)
        self.saveData()
    }
    
}
