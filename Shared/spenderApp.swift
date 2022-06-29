//
//  spenderApp.swift
//  Shared
//
//  Created by sano on 6/28/22.
//

import SwiftUI

@main
struct spenderApp: App {
    private let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            GuardScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
