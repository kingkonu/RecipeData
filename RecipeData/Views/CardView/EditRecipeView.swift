//
//  EditRecipeView.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/21/24.
//

import SwiftUI
import SwiftData

struct EditRecipeView: View {
    @Bindable var recipes: Breakfast
    
    var body: some View {
        Form {
            TextField("Название", text: $recipes.name)
        }
        .navigationTitle("Изменить название блюда")
    }
}

#Preview {
    do{
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Recipe.self, configurations: config)
        let example = Breakfast(name: "Paprica")
        return EditRecipeView(recipes: example)
            .modelContainer(container)
    } catch {
        fatalError("failed to create model")
    }
}
