//
//  WelcomeScreen.swift
//  spender
//
//  Created by sano on 6/28/22.
//

import SwiftUI

struct WelcomeScreen: View {
    @State private var activeTab = 0
    
    private let carouselData: [CarouselItem] = [
        CarouselItem(
            title: "Organaze your expences",
            caption: "Track all your expencas and income in single application",
            image: "organize"),
        CarouselItem(
            title: "Organaze your expences",
            caption: "Track all your expencas and income in single application",
            image: "analyze"),
        CarouselItem(
            title: "Organaze your expences",
            caption: "Track all your expencas and income in single application",
            image: "increase")
    ]
    
    var body: some View {
        VStack {
#if os(iOS)
            TabView (selection: $activeTab) {
                ForEach ((0..<carouselData.count), id: \.self) { i in
                    CarouselItemView(data: carouselData[i])
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
#else
            TabView (selection: $activeTab) {
                ForEach ((0..<carouselData.count), id: \.self) { i in
                    CarouselItemView(data: carouselData[i])
                }
            }
#endif
            
            HStack {
                ForEach((0..<carouselData.count), id: \.self) { i in
                    Circle()
                        .fill(i == activeTab ? BrandColors.primary : BrandColors.gray)
                        .frame(width: 10, height: 10)
                        .onTapGesture {
                            withAnimation {
                                activeTab = i
                            }
                        }
                }
            }
            
            
            Button("Getting Started", action: { User.shared.markInstructionsAsRead() })
                .primary()
                .padding(.vertical, 20)
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
