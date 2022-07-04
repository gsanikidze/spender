//
//  CategoriesScreen.swift
//  spender
//
//  Created by sano on 7/1/22.
//

import SwiftUI

struct CategoriesScreen: View {
    @State private var isCreateCatOpen = false
    
    @FetchRequest(entity: ExpenseCategory.entity(), sortDescriptors: []) private var categories: FetchedResults<ExpenseCategory>
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 20) {
                    ForEach(categories) { cat in
                        HStack {
                            Text("Total \(cat.expenses!.count) expense")
                                .font(.caption)
                            Spacer()
                        }
                        .card(title: cat.title!, icon: cat.icon!)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Categories"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button (action: { isCreateCatOpen.toggle() }) {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $isCreateCatOpen) {
                    CreateCategoryScreen()
                }
            }
        }
    }
}

struct CategoriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesScreen()
    }
}
