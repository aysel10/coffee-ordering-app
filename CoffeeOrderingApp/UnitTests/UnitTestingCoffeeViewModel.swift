//
//  UnitTestingCoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Aysel on 11/17/21.
//

import Foundation
import SwiftUI

class UnitTestingCoffeeViewModel: ObservableObject {
    @Published var isPremium: Bool
    
    init(isPremium: Bool){
        self.isPremium = isPremium
    }
}
