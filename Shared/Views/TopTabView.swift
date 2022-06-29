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
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            HStack (spacing: 10) {
                ForEach(0..<tabs.count, id: \.self) { i in
                    Text(tabs[i].label)
                        .padding(10)
                        .background(i == selectedTab ? BrandColors.primary : BrandColors.lightGray)
                        .foregroundColor(i == selectedTab ? .white : .gray)
                        .cornerRadius(5)
                        .clipped()
                        .onTapGesture {
                            withAnimation {
                                selectedTab = i
                            }
                        }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding(.vertical)
            .background(
                Color.white
                    .ignoresSafeArea()
                    .shadow(color: BrandColors.dark.opacity(0.2), radius: 10, x: 0, y: 2)
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
