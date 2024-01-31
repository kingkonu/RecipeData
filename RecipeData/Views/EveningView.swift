//
//  EveningView.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/21/24.
//

import SwiftUI
import SwiftData

struct EveningView: View {
    @State private var evening = [Evening]()
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder = SortDescriptor(\Evening.name)
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationStack(path: $evening) {
            RecipeListingEveningView(sort: sortOrder, searchString: searchText)
                .navigationTitle("Ужины")
                .navigationDestination(for: Evening.self, destination: EditEveningView.init)
                .searchable(text: $searchText)
                .toolbar {
                    Button("Добавить рецепт", systemImage: "plus", action: addRecipe)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Name")
                                .tag(SortDescriptor(\Evening.name))
                        }
                        .pickerStyle(.inline)
                    }
                }
        }
    }
    
    func addRecipe() {
        let recipe = Evening()
        modelContext.insert(recipe)
        evening = [recipe]
    }
}

#Preview {
    EveningView()
}
