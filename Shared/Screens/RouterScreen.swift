//
//  RouterScreen.swift
//  spender
//
//  Created by sano on 6/29/22.
//

import SwiftUI

struct RouterScreen: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CategoriesScreen()
                .tabItem {
                    Label("Categories", systemImage: "square.grid.2x2")
                }
            
            Text("Insights Screen")
                .tabItem {
                    Label("Insights", systemImage: "chart.bar")
                }
            
            Text("Scanned Docs Screen")
                .badge("!")
                .tabItem {
                    Label("Checkes", systemImage: "doc.viewfinder")
                }
        }
    }
}

struct RouterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RouterScreen()
    }
}
