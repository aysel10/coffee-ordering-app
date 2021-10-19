//
//  OrderListView.swift
//  CoffeeOrderingApp
//
//  Created by icelkas on 16/10/2021.
//

import SwiftUI

struct OrderListView: View {
    
    var orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            
            ForEach(self.orders, id: \.id) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width:100, height: 100)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(16)
                        .foregroundColor(Color.white)
                    
                    VStack(alignment: .leading){
                        
                        Text(order.name)
                            .font(.system(size:20))
                        
                        HStack{
                            Text(order.coffeeName)
                                .padding(10)
                                .background(Color.gray)
                                .cornerRadius(10.0)
                                .foregroundColor(.white)
                            
                            Text(order.size)
                                .padding(10)
                                .background(Color.blue)
                                .cornerRadius(10.0)
                                .foregroundColor(.white)
                        }
                        
                        
                    }
                    Spacer()
                    
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(name: "Aydan", coffeeName: "Americano", total: 2, size: "Medium")),OrderViewModel(order: Order(name: "Aysel", coffeeName: "Cappuccino", total: 2.5, size: "Big"))])
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
