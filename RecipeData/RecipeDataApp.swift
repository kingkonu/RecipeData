//
//  RecipeDataApp.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/21/24.
//

import SwiftUI
import SwiftData

@main
struct RecipeDataApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
        .modelContainer(for: Recipe.self)
    }
}
