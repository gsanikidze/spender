//
//  Expense.swift
//  spender
//
//  Created by sano on 7/5/22.
//

import Foundation
import CoreData

extension PersistenceController {
    func createExpense(moc: NSManagedObjectContext, title: String, amount: Double, category: ExpenseCategory) {
        let expense = Expense(context: moc)
        expense.id = UUID()
        expense.title = title
        expense.category = category
        expense.amount = amount
        
        self.save(moc)
    }
}
