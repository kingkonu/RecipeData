//
//  EditDinnerView.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/30/24.
//

import SwiftUI
import SwiftData

struct EditDinnerView: View {
    @Bindable var recipes: Dinner

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
        let example = Dinner(name: "Paprica")
        return EditDinnerView(recipes: example)
            .modelContainer(container)
    } catch {
        fatalError("failed to create model")
    }
}
