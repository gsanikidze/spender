//
//  Income.swift
//  spender
//
//  Created by sano on 7/1/22.
//

import Foundation

struct Income: Identifiable {
    var id: UUID
    var title: String
    var amount: Double
    
    init(title: String, amount: Double) {
        self.id = UUID()
        self.title = title
        self.amount = amount
    }
}
