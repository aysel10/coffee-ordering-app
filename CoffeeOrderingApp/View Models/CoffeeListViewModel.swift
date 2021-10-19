//
//  CoffeeListViewModel.swift
//  CoffeeOrderingApp
//
//  Created by icelkas on 17/10/2021.
//

import Foundation


class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = [CoffeeViewModel]()
}


struct CoffeeViewModel {
    
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return self.coffee.name
    }
    
    var imageURL: String {
        return self.coffee.imageUrl
    }
    
    var price: Double {
        return self.coffee.price
    }
}
