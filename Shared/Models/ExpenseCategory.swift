//
//  Category.swift
//  spender
//
//  Created by sano on 7/4/22.
//

import Foundation
import CoreData

extension PersistenceController {
    func createExpenseCategory(moc: NSManagedObjectContext, title: String, icon: String) {
        let cat = ExpenseCategory(context: moc)
        
        cat.id = UUID()
        cat.title = title
        cat.icon = icon
        
        self.save(moc)
    }
}
