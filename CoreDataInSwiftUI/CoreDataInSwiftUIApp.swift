//
//  CoreDataInSwiftUIApp.swift
//  CoreDataInSwiftUI
//
//  Created by Suneet  Agrawal on 04/08/23.
//

import SwiftUI

@main
struct CoreDataInSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
