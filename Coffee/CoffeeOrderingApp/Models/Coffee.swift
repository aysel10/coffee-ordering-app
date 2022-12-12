//
//  Coffee.swift
//  CoffeeOrderingApp
//
//  Created by icelkas on 16/10/2021.
//

import Foundation

struct Coffee {
    var name: String
    var imageUrl: String
    var price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageUrl: "Cappuccino", price: 2.5),
            Coffee(name: "Espresso", imageUrl: "Espresso", price: 2.0),
            Coffee(name: "Americano", imageUrl: "Americano", price: 2.2)
        ]
    }
}
