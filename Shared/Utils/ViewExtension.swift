//
//  ViewExtensions.swift
//  spender
//
//  Created by sano on 7/1/22.
//

import SwiftUI

struct MultiShadow: ViewModifier {
    @Environment(\.colorScheme) var colorSchema
    
    func body(content: Content) -> some View {
        content
            .background(
                Color(UIColor.systemBackground)
                    .shadow(color: (colorSchema == .dark ? .white : BrandColors.dark).opacity(0.2) , radius: 10, x: 0, y: 2)
            )
    }
}

struct Card: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemBackground))
                .multiShadow()
            
            VStack (spacing: 10) {
                content
            }
            .padding()
        }
    }
}

extension View {
    func multiShadow() -> some View {
        modifier(MultiShadow())
    }
    
    func card() -> some View {
        modifier(Card())
    }
}
