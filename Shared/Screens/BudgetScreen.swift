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
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.systemBackground))
                        .multiShadow()
                    
                    VStack (spacing: 10) {
                        Text("Total Budget")
                            .font(.caption)
                        Text("$5000")
                            .font(.headline)
                            .foregroundColor(BrandColors.primary)
                    }
                    .padding()
                }
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
