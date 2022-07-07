//
//  HomeScreen.swift
//  spender
//
//  Created by sano on 7/1/22.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: ExpenseCategory.entity(), sortDescriptors: []) private var categories: FetchedResults<ExpenseCategory>
    @FetchRequest(entity: Expense.entity(), sortDescriptors: []) private var expenses: FetchedResults<Expense>
    @FetchRequest(entity: Income.entity(), sortDescriptors: []) private var incomes: FetchedResults<Income>
    
    @State private var createExpenseIn: ExpenseCategory?
    @State private var isCreateIncomeOpen = false
    
    private var totalBudget: Double {
        return incomes.reduce(0) { $0 + $1.amount }
    }
    
    private var totalSpend: Double {
        get {
            return expenses.reduce(0) { $0 + $1.amount }
        }
    }
    
    private var totalRemaining: Double {
        get {
            return totalBudget - totalSpend
        }
    }
    
    private func clearBudget() {
        for cat in categories {
            PersistenceController.shared.delete(moc, cat)
        }
        
        for inc in incomes {
            PersistenceController.shared.delete(moc, inc)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack (spacing: 20) {
                VStack (spacing: 10) {
                    Text("Total Budget")
                        .font(.caption)
                    Text("$\(String(format: "%.2f", totalBudget))")
                        .font(.headline)
                        .foregroundColor(BrandColors.primary)
                }
                .card()
                
                HStack (spacing: 20) {
                    VStack (spacing: 10) {
                        Text("Remaining")
                            .font(.caption)
                        Text("$\(String(format: "%.2f", totalRemaining))")
                            .font(.headline)
                            .foregroundColor(BrandColors.primary)
                    }
                    .card()
                    
                    VStack (spacing: 10) {
                        Text("Spent")
                            .font(.caption)
                        Text("$\(String(format: "%.2f", totalSpend))")
                            .font(.headline)
                            .foregroundColor(BrandColors.rose)
                    }
                    .card()
                }
                
                VStack (spacing: 0) {
                    if incomes.count == 0 {
                        Text("There is no income")
                            .font(.caption)
                    } else {
                        ForEach(incomes) { income in
                            HStack {
                                Text(income.title!)
                                    .font(.caption)
                                Spacer()
                                Text("$\(String(format: "%.2f", income.amount))")
                                    .font(.footnote)
                                    .foregroundColor(BrandColors.primary)
                            }
                            .padding(.vertical, 10)
                            
                            Divider()
                                .background(BrandColors.lightGray)
                        }
                    }
                    
                    HStack {
                        Button("Add Income", action: { isCreateIncomeOpen.toggle() })
                        Spacer()
                    }
                    .padding(.top)
                }
                .card(title: "Income")
                
                Section (header: Text("Expenses")) {
                    VStack (spacing: 20) {
                        if categories.count == 0 {
                            Text("There is no expenses")
                                .font(.caption)
                        } else {
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
                                                Text("$\(String(format: "%.2f", expsense.amount))")
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
                
                if !(totalSpend == 0 && totalBudget == 0 && totalRemaining == 0) {
                    Button("Reset Budget", action: { clearBudget() })
                        .foregroundColor(BrandColors.rose)
                }
            }
            .padding(20)
            .sheet(isPresented: $isCreateIncomeOpen) {
                CreateIncomeScreen()
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
