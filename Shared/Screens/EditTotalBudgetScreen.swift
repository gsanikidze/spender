//
//  EditTotalBudgetScreen.swift
//  spender
//
//  Created by sano on 7/7/22.
//

import SwiftUI

struct EditTotalBudgetScreen: View {
    @Environment (\.dismiss) private var dismiss
    
    @State private var amount = User.shared.totalBudget
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("Total Budget", value: $amount, format: .number)
                        .textFieldStyle(.roundedBorder)
                }
            }
            .padding()
            .navigationTitle("Edit Budget")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .cancellationAction) {
                    Button("Cancel", action: { dismiss() })
                }
                ToolbarItem {
                    Button("Save", action: {
                        User.shared.updatTotalBudget(amount)
                        dismiss()
                    })
                }
            }
        }
    }
}

struct EditTotalBudgetScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditTotalBudgetScreen()
    }
}
