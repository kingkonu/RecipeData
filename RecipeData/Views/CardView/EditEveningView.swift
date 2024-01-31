//
//  EditEveningView.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/30/24.
//

import SwiftUI
import SwiftData

struct EditEveningView: View {
    @Bindable var recipes: Evening
    
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
        let example = Evening(name: "Paprica")
        return EditEveningView(recipes: example)
            .modelContainer(container)
    } catch {
        fatalError("failed to create model")
    }
}
