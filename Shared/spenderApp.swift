//
//  spenderApp.swift
//  Shared
//
//  Created by sano on 6/28/22.
//

import SwiftUI

@main
struct spenderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
