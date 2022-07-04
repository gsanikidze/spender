//
//  CreateCategoryScreen.swift
//  spender
//
//  Created by sano on 7/4/22.
//

import SwiftUI

struct CreateCategoryScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var moc
    
    private let icons = [
        "house", "building.columns", "lightbulb", "display", "graduationcap", "globe.americas", "heart", "airplane", "flame", "clock", "music.note", "tshirt"
    ]
    
    private let columns = Array(repeating: GridItem(spacing: 20), count: 3)
    
    private func createCategory() {
        PersistenceController.shared.createExpenseCategory(moc: moc, title: title, icon: icon)
        dismiss()
    }
    
    @State private var title = ""
    @State private var icon = "house"
    
    var body: some View {
        NavigationView {
            Form {
                VStack (spacing: 20) {
                    TextField("Title", text: $title)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(icons, id: \.self) { icon in
                            Circle()
                                .strokeBorder(icon == self.icon ? BrandColors.primary : BrandColors.gray)
                                .frame(width: 45, height: 45)
                                .background(
                                    Image(systemName: icon)
                                        .font(.system(size: 15))
                                        .foregroundColor(icon == self.icon ? Color(UIColor.systemBackground) : BrandColors.gray)
                                        .frame(width: 45, height: 45)
                                        .background(
                                            BrandColors.primary
                                                .cornerRadius(100)
                                                .opacity(icon == self.icon ? 1 : 0)
                                        )
                                )
                                .clipped()
                                .onTapGesture {
                                    withAnimation {
                                        self.icon = icon
                                    }
                                }
                        }
                    }
                }.padding()
            }
            .navigationTitle("Create Category")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel", action: { dismiss() }),
                trailing: Button("Save", action: createCategory)
            )
        }
    }
}

struct CreateCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateCategoryScreen()
    }
}
