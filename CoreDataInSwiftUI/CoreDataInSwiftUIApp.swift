//
//  CoreDataInSwiftUIApp.swift
//  CoreDataInSwiftUI
//
//  Created by Suneet  Agrawal on 04/08/23.
//

import SwiftUI
import CoreData

@main
struct CoreDataInSwiftUIApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            EmployeeView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
