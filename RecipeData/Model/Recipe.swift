//
//  Recipe.swift
//  RecipeData
//
//  Created by Alexey Kanaev on 1/21/24.
//

import Foundation
import SwiftData

@Model
class Recipe {
    let breakfast: [Breakfast]
    let dinner: [Dinner]
    let evening: [Evening]

    init(breakfast: [Breakfast], dinner: [Dinner], evening: [Evening]) {
        self.breakfast = breakfast
        self.dinner = dinner
        self.evening = evening
    }
}

@Model
class Breakfast {
    let id = UUID()
    var name: String = ""
    var describe: String = ""
    var ingredients: String = ""
    var cooking: String = ""
    var isFavorite: Bool

    init(name: String = "", describe: String = "", ingredients: String = "", cooking: String = "", isFavorite: Bool = false) {
        self.name = name
        self.describe = describe
        self.ingredients = ingredients
        self.cooking = cooking
        self.isFavorite = isFavorite
    }
}


@Model
class Dinner {
    let id = UUID()
    var name: String = ""
    let describe: String = ""
    let ingredients: String = ""
    let cooking: String = ""
    var isFavorite: Bool

    init(name: String = "", describe: String = "", ingredients: String = "", cooking: String = "", isFavorite: Bool = false) {
        self.name = name
        self.describe = describe
        self.ingredients = ingredients
        self.cooking = cooking
        self.isFavorite = isFavorite
    }
}

@Model
class Evening {
    let id = UUID()
    var name: String = ""
    let describe: String = ""
    let ingredients: String = ""
    let cooking: String = ""
    var isFavorite: Bool

    init(name: String = "", describe: String = "", ingredients: String = "", cooking: String = "", isFavorite: Bool = false) {
        self.name = name
        self.describe = describe
        self.ingredients = ingredients
        self.cooking = cooking
        self.isFavorite = isFavorite
    }
}

