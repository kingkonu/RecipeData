//
//  BreakfastView.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/21/24.
//

import SwiftUI
import SwiftData

struct BreakfastView: View {
    @State private var path = [Breakfast]()
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder = SortDescriptor(\Breakfast.name)
    @State private var searchText = ""


    var body: some View {
        NavigationStack(path: $path) {
            RecipeListingView(sort: sortOrder, searchString: searchText)
                .navigationTitle("Завтраки")
                .navigationDestination(for: Breakfast.self, destination: EditRecipeView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Добавить рецепт", systemImage: "plus", action: addRecipe)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Breakfast.name))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addRecipe() {
        let recipe = Breakfast()
        modelContext.insert(recipe)
        path = [recipe]
    }
}

#Preview {
    BreakfastView()
}
