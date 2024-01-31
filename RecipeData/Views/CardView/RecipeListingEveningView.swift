//
//  RecipeListingEveningView.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/30/24.
//

import SwiftUI
import SwiftData

struct RecipeListingEveningView: View {
    @Query (sort: [SortDescriptor(\Evening.name, order: .reverse)]) var recipes: [Evening]
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink(value: recipe) {
                    VStack(alignment: .leading) {
                        Text(recipe.name)
                            .font(.headline)
                        Text(recipe.describe)
                    }
                }
            }
            .onDelete(perform: deleteRecipe)
        }
    }
    
    init(sort: SortDescriptor<Evening>, searchString: String) {
        _recipes = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    
    func deleteRecipe(_ indexSet: IndexSet) {
        for index in indexSet {
            let recipe = recipes[index]
            modelContext.delete(recipe)
        }
    }
}

#Preview {
    RecipeListingEveningView(sort: SortDescriptor(\Evening.name), searchString: "")
}
