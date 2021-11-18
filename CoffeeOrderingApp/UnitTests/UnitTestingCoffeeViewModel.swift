//
//  UnitTestingCoffeeViewModel.swift
//  CoffeeOrderingApp
//
//  Created by Aysel on 11/17/21.
//

import Foundation
import SwiftUI

protocol NewDataServiceProtocol {
    
}

class NewMockDataSErice: NewDataServiceProtocol {
    
    let items : [String]
    
    init(items: [String]?){
        self.items = items ?? [
            "one", "two", "three"
        ]
    }
    
    func downloadItemsWithEscaping(completion: @escaping (_ items: String) -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            //completion(self.items)
        }
    }
    
}

class UnitTestingCoffeeViewModel: ObservableObject {
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem: String? = nil
    
    init(isPremium: Bool){
        self.isPremium = isPremium
    }
    
    func addItem(item: String) {
        guard !item.isEmpty else {return}
        dataArray.append(item)
    }
    
    func selectItem(item: String){
        if let x = dataArray.first(where: {$0 == item}){
            selectedItem = x
        }else {
            selectedItem = nil
        }
    }
    
    func saveItem(item: String) throws {
        
        guard !item.isEmpty else{
            throw DataError.noData
        }
        
        if let x = dataArray.first(where: {$0 == item}){
            print("Item is saved \(x)")
        }else{
            throw DataError.itemNotFound
        }
        
    }
    
    enum DataError: LocalizedError {
        case noData
        case itemNotFound
    }
}
