//
//  DinnerView.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/21/24.
//

import SwiftUI
import SwiftData

struct DinnerView: View {
    @State private var dinner = [Dinner]()
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder = SortDescriptor(\Dinner.name)
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationStack(path: $dinner) {
            RecipeListingDinnerView(sort: sortOrder, searchString: searchText)
                .navigationTitle("Обеды")
                .navigationDestination(for: Dinner.self, destination: EditDinnerView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Добавить рецепт", systemImage: "plus", action: addRecipe)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Dinner.name))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addRecipe() {
        let recipe = Dinner()
        modelContext.insert(recipe)
        dinner = [recipe]
    }
}

#Preview {
    DinnerView()
}
