//
//  Income.swift
//  spender
//
//  Created by sano on 7/1/22.
//

import Foundation
import CoreData

extension PersistenceController {
    func createIncome(moc: NSManagedObjectContext, title: String, amount: Double) {
        let income = Income(context: moc)
        
        income.id = UUID()
        income.title = title
        income.amount = amount
        
        self.save(moc)
    }
}
