//
//  HomeScreen.swift
//  spender
//
//  Created by sano on 6/29/22.
//

import SwiftUI

struct TabItem {
    var title: String
    var label: String
}

struct HomeScreen: View {
    @State private var selectedTab = 0
    
    private let tabs: [TopTabItem] = [
        TopTabItem(label: "Budget", content: AnyView(Text("Planned Tab"))),
        TopTabItem(label: "Spent", content: AnyView(Text("Spent Tab"))),
        TopTabItem(label: "Remaining", content: AnyView(Text("Remaining Tab")))
    ]
    
    var body: some View {
        TopTabView(tabs: tabs)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
