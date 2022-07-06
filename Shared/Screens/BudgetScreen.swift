//
//  BudgetScreen.swift
//  spender
//
//  Created by sano on 7/1/22.
//

import SwiftUI

struct BudgetScreen: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: ExpenseCategory.entity(), sortDescriptors: []) private var categories: FetchedResults<ExpenseCategory>
    @FetchRequest(entity: Expense.entity(), sortDescriptors: []) private var expenses: FetchedResults<Expense>
    
    private var incomes: [Income] = []
    @State private var createExpenseIn: ExpenseCategory?
    
    private var totalSpend: Double {
        get {
            return expenses.reduce(0) { $0 + $1.amount }
        }
    }
    
    init () {
        self.incomes = [
            PersistenceController.shared.createIncome(moc: moc, title: "Sallery", amount: 2000),
            PersistenceController.shared.createIncome(moc: moc, title: "Passive Income", amount: 1000)
        ]
    }
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                VStack (spacing: 10) {
                    Text("Total Budget")
                        .font(.caption)
                    Text("$5000")
                        .font(.headline)
                        .foregroundColor(BrandColors.primary)
                }
                .card()
                
                HStack (spacing: 20) {
                    VStack (spacing: 10) {
                        Text("Remaining")
                            .font(.caption)
                        Text("$3000")
                            .font(.headline)
                            .foregroundColor(BrandColors.primary)
                    }
                    .card()
                    
                    VStack (spacing: 10) {
                        Text("Spent")
                            .font(.caption)
                        Text("$ \(String(format: "%.2f", totalSpend))")
                            .font(.headline)
                            .foregroundColor(BrandColors.rose)
                    }
                    .card()
                }
                
                VStack (spacing: 0) {
                    ForEach(incomes) { income in
                        HStack {
                            Text(income.title!)
                                .font(.subheadline)
                            Spacer()
                            Text("$ \(String(format: "%.2f", income.amount))")
                                .font(.footnote)
                                .foregroundColor(BrandColors.primary)
                        }
                        .padding(.vertical, 10)
                        
                        Divider()
                            .background(BrandColors.lightGray)
                    }
                    
                    HStack {
                        Button("Add Income", action: {})
                        Spacer()
                    }
                    .padding(.top)
                }
                .card(title: "Income")
                
                Section (header: Text("Expenses")) {
                    VStack (spacing: 20) {
                        ForEach(categories) { cat in
                            VStack (spacing: 15) {
                                Divider()
                                
                                if cat.expenses?.count == 0 {
                                    Text("There is no expense in this categorie")
                                        .font(.caption)
                                } else {
                                    ForEach(Array(cat.expenses as! Set<Expense>)) { expsense in
                                        HStack {
                                            Text(expsense.title!)
                                                .font(.caption)
                                            Spacer()
                                            Text("$ \(String(format: "%.2f", expsense.amount))")
                                                .font(.caption)
                                                .foregroundColor(BrandColors.primary)
                                                .bold()
                                        }
                                    }
                                }
                                
                                Divider()
                                
                                HStack {
                                    Spacer()
                                    Button("Add", action: { self.createExpenseIn = cat })
                                        .primary(size: .sm)
                                }
                            }
                            .card(title: cat.title!, icon: cat.icon!)
                            
                        }
                        .sheet(item: $createExpenseIn) { category in
                            CreateExpenseScreen(expenseCategory: category)
                        }
                    }
                }
            }
            .padding(20)
        }
    }
}

struct BudgetScreen_Previews: PreviewProvider {
    static var previews: some View {
        BudgetScreen()
    }
}
