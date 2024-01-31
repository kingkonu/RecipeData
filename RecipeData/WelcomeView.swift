//
//  WelcomeView.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/30/24.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    @State private var animate = false
    @Environment(\.modelContext) var modelContext

    var body: some View {

        ZStack {
            Image(systemName: "basketball.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .scaleEffect(animate ? 2 : 1)
                .onTapGesture {
                    if UserDefaults.standard.bool(forKey: "add") {
                        print("Функция не будет выполнена")
                    } else {
                        UserDefaults.standard.set(true, forKey: "add")
                        add()
                    }
                    animate.toggle()
                }
                .animation(.easeIn(duration: 5), value: animate)

            ContentView()
                .opacity(animate ? 1 : 0)
                .animation(.easeOut.delay(1), value: animate)
        }
    }

    func add() {
        for recipe in recipeDataBreakfast {
            modelContext.insert(recipe)
        }
        for recipe in recipeDataDinner {
            modelContext.insert(recipe)
        }
        for recipe in recipeDataEvening {
            modelContext.insert(recipe)
        }
    }
}


#Preview {
    WelcomeView()
}
