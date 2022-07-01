//
//  BudgetScreen.swift
//  spender
//
//  Created by sano on 7/1/22.
//

import SwiftUI

struct BudgetScreen: View {
    private let incomes: [Income] = [
        Income(title: "Sallery", amount: 2000),
        Income(title: "Passive Income", amount: 1000)
    ]
    
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
                
                VStack (spacing: 0) {
                    ForEach(incomes) { income in
                        HStack {
                            Text(income.title)
                                .font(.subheadline)
                            Spacer()
                            Text("$ \(Int(income.amount))")
                                .font(.footnote)
                                .foregroundColor(BrandColors.primary)
                        }
                        .padding(.vertical, 10)
                        
                        Divider()
                    }
                    
                    HStack {
                        Button("Add Income", action: {})
                        Spacer()
                    }
                    .padding(.top)
                }
                .card(title: "Income")
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
    }
}

struct BudgetScreen_Previews: PreviewProvider {
    static var previews: some View {
        BudgetScreen()
    }
}
