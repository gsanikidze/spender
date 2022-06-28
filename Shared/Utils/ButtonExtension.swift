//
//  ButtonExtenstion.swift
//  spender
//
//  Created by sano on 6/28/22.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .background(BrandColors.primary)
            .cornerRadius(10)
    }
}

struct SecondaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(BrandColors.primary)
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(BrandColors.primary, lineWidth: 2)
            }
    }
}

extension Button {
    func primary() -> some View {
        modifier(PrimaryButtonModifier())
    }
    
    func secondary() -> some View {
        modifier(SecondaryButtonModifier())
    }
}
