//
//  AddCoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by icelkas on 17/10/2021.
//

import Foundation

class AddCoffeeViewModel: ObservableObject {
    
    private var coffeeService: CoffeeService
    
    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    init() {
        self.coffeeService = CoffeeService()
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() {
        let  order = Order(name: self.name, coffeeName: self.coffeeName, total: self.total, size: self.size)
        self.coffeeService.createOrder(order: order){ order in
            
        }
    }
    
    private func priceForSize () -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    
    }
    
}
