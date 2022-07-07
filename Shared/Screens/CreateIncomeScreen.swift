//
//  CreateIncomeScreen.swift
//  spender
//
//  Created by sano on 7/7/22.
//

import SwiftUI

struct CreateIncomeScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var moc
    
    @State private var amount = 0.0
    @State private var title = ""
    
    private func saveIncome() {
        PersistenceController.shared.createIncome(moc: moc, title: title, amount: amount)
        dismiss()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("Title", text: $title)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("Amount", value: $amount, format: .number)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
            }
            .navigationTitle("Create Income")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: { dismiss() })
                }
                ToolbarItem {
                    Button("Save", action: { saveIncome() })
                }
            }
        }
    }
}

struct CreateIncomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateIncomeScreen()
    }
}
