//
//  CreateExpenseScreen.swift
//  spender
//
//  Created by sano on 7/5/22.
//

import SwiftUI

struct CreateExpenseScreen: View {
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var amount = 0.0
    
    var expenseCategory: ExpenseCategory
    
    private func createExpense() {
        PersistenceController.shared.createExpense(moc: moc, title: title, amount: amount, category: expenseCategory)
        dismiss()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20) {
                    TextField("Title", text: $title)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Amount", value: $amount, format: .number)
                        .textFieldStyle(.roundedBorder)
                }
            }
            .padding()
            .navigationTitle("Create Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading) {
                    Button("Cancel", action: { dismiss() })
                }
                ToolbarItem {
                    Button (action: { createExpense() }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct CreateExpenseScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateExpenseScreen(expenseCategory: ExpenseCategory())
    }
}
