//
//  InsightsScreen.swift
//  spender
//
//  Created by sano on 7/8/22.
//

import SwiftUI
import Charts
import CoreData

struct InsightsScreen: View {
    @Environment(\.managedObjectContext) private var moc
    @FetchRequest(entity: ExpenseCategory.entity(), sortDescriptors: []) private var categories: FetchedResults<ExpenseCategory>
    @FetchRequest(entity: Income.entity(), sortDescriptors: []) private var incomes: FetchedResults<Income>
    
    private var categoriesData: [PieChartDataEntry] {
        get {
            var data: [PieChartDataEntry] = []
            
            for cat in categories {
                var total = cat.expenses!.reduce(0) { $0 + ($1 as! Expense).amount }
                
                data.append(
                    PieChartDataEntry(
                        value: total,
                        label: cat.title,
                        icon: NSUIImage(systemName: cat.icon!)
                    )
                )
            }
            
            return data
        }
    }
    
    private var incomesData: [PieChartDataEntry] {
        get {
            var data: [PieChartDataEntry] = []
            
            for income in incomes {
                data.append(
                    PieChartDataEntry(
                        value: income.amount,
                        label: income.title
                    )
                )
            }
            
            return data
        }
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack (spacing: 20) {
                    HStack {
                        Spacer()
                        PieChart(entries: incomesData)
                            .frame(width: geo.size.width - 80, height: 300)
                            .foregroundColor(.red)
                        Spacer()
                    }
                    .card(title: "Incomes")
                    
                    HStack {
                        Spacer()
                        PieChart(entries: categoriesData)
                            .frame(width: geo.size.width - 80, height: 300)
                            .foregroundColor(.red)
                        Spacer()
                    }
                    .card(title: "Expenses By Category")
                }
                .padding()
            }
        }
    }
}

struct InsightsScreen_Previews: PreviewProvider {
    static var previews: some View {
        InsightsScreen()
    }
}
