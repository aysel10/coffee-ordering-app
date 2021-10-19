//
//  ContentView.swift
//  CoffeeOrderingApp
//
//  Created by icelkas on 16/10/2021.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var orderListViewModel = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            OrderListView(orders: self.orderListViewModel.orders)
                
                .navigationBarTitle("Coffee Orders")
                
                .navigationBarItems(leading: Button(action: reloadOrders){
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                }, trailing: Button(action: showAddCoffeeOrderView){
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                })
                
                .sheet(isPresented: self.$showModal, onDismiss: reloadOrders) {
                    AddCoffeeOrderView(isPresented: self.$showModal)
                }
        }
    }
    
    private func reloadOrders(){
        self.orderListViewModel.fetchAllOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
