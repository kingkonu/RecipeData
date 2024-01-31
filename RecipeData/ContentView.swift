//
//  ContentView.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/21/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        TabView {
            BreakfastView()
                .tabItem {
                    Image(systemName: "cup.and.saucer.fill")
                }
            DinnerView()
                .tabItem {
                    Image(systemName: "carrot.fill")
                }
            EveningView()
                .tabItem {
                    Image(systemName: "fork.knife")
                }
        }
    }
}


#Preview {
    ContentView()
}
