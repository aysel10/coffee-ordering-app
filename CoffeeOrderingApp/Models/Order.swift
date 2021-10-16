//
//  Order.swift
//  CoffeeOrderingApp
//
//  Created by icelkas on 16/10/2021.
//

import Foundation

struct Order: Codable {
    var name: String
    var coffeeName: String
    var total: Double
    var size: String
}
