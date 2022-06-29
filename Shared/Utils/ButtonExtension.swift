//
//  ButtonExtenstion.swift
//  spender
//
//  Created by sano on 6/28/22.
//

import SwiftUI

enum ButtonSize {
    case md
    case sm
}

struct PrimaryButtonModifier: ViewModifier {
    var size: ButtonSize = .md
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(size == .md ? 20 : 10)
            .background(BrandColors.primary)
            .cornerRadius(10)
    }
}

struct SecondaryButtonModifier: ViewModifier {
    var size: ButtonSize = .md
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(BrandColors.primary)
            .padding(size == .md ? 20 : 10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(BrandColors.primary, lineWidth: 2)
            }
    }
}

struct FilltedButtonModifier: ViewModifier {
    var size: ButtonSize = .md
    
    @Environment(\.colorScheme) private var colorScheme
    
    func body(content: Content) -> some View {
        content
            .padding(size == .md ? 20 : 10)
            .background(colorScheme == .dark ? BrandColors.dark : BrandColors.lightGray)
            .foregroundColor(.gray)
            .cornerRadius(5)
            .clipped()
    }
}

extension Button {
    func primary(size: ButtonSize = .md) -> some View {
        modifier(PrimaryButtonModifier(size: size))
    }
    
    func secondary(size: ButtonSize = .md) -> some View {
        modifier(SecondaryButtonModifier(size: size))
    }
    
    func filled(size: ButtonSize = .md) -> some View {
        modifier(FilltedButtonModifier(size: size))
    }
}
