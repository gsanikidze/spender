//
//  BudgetScreen.swift
//  spender
//
//  Created by sano on 7/1/22.
//

import SwiftUI

struct BudgetScreen: View {
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
