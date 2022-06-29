//
//  TopTabView.swift
//  spender
//
//  Created by sano on 6/29/22.
//

import SwiftUI

struct TopTabItem {
    var label: String;
    var content: AnyView;
}

struct TopTabView: View {
    var tabs: [TopTabItem]
    
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            HStack (spacing: 0) {
                ForEach(0..<tabs.count, id: \.self) { i in
                    VStack (spacing: 20) {
                        if i == selectedTab {
                            Text(tabs[i].label)
                                .foregroundColor(BrandColors.primary)
                        } else {
                            Text(tabs[i].label)
                                .foregroundColor(colorScheme == .dark ? BrandColors.gray : BrandColors.dark)
                        }
                        
                        Rectangle()
                            .fill(BrandColors.primary)
                            .frame(height: i == selectedTab ? 1 : 0)
                    }
                    .padding(.top)
                    .onTapGesture {
                        withAnimation {
                            selectedTab = i
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .background(
                Color(UIColor.systemBackground)
                    .ignoresSafeArea()
                    .shadow(color: (colorScheme == .dark ? .white : BrandColors.dark).opacity(0.2) , radius: 10, x: 0, y: 2)
            )
            
            TabView (selection: $selectedTab) {
                ForEach(0..<tabs.count, id: \.self) { i in
                    tabs[i].content
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

let tabs: [TopTabItem] = [
    TopTabItem(label: "Planned", content: AnyView(Text("Planned Tab"))),
    TopTabItem(label: "Spent", content: AnyView(Text("Spent Tab"))),
    TopTabItem(label: "Remaining", content: AnyView(Text("Remaining Tab")))
]

struct TopTabView_Previews: PreviewProvider {
    static var previews: some View {
        TopTabView(tabs: tabs)
    }
}
