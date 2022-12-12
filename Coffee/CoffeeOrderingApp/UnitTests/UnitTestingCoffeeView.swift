//
//  UnitTestingCoffeeView.swift
//  CoffeeOrderingApp
//
//  Created by Aysel on 11/17/21.
//

import SwiftUI


struct UnitTestingCoffeeView: View {
    
    
    @StateObject private var vm: UnitTestingCoffeeViewModel
    
    init(isPremium: Bool){
        _vm = StateObject(wrappedValue: UnitTestingCoffeeViewModel(isPremium: isPremium))
    }
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingCoffeeView(isPremium: true)
    }
}
