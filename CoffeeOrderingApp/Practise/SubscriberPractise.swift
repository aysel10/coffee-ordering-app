//
//  SubscriberPractise.swift
//  CoffeeOrderingApp
//
//  Created by Aysel on 11/18/21.
//

import SwiftUI
import Combine


class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
    var cancelables = Set<AnyCancellable>()

    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
//    var timer: AnyCancellable? // any object that can be cancelled
    
    init(){
        setupTimer()
        addTextFieldSubscriber()
    }
    
    func addTextFieldSubscriber(){
        $textFieldText
            .map { (text) -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
            .assign(to: \.textIsValid, on: self)
            .store(in: &cancelables)
    }
    
    func setupTimer() {
        Timer
            .publish(every: 1.0,  on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in  //we subscribe to values
                guard let self = self else {return} // assign to strong self
                self.count += 1
            }.store(in: &cancelables)
    }
//                if self.count >= 10{
//                    for item in self.cancelables {
//                        item.cancel()
//                    }
//                }
    
}

struct SubscriberPractise: View {
    
    @StateObject var vm = SubscriberViewModel()
    @State var m = ""
    
    var body: some View {
        VStack{
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text("\(String(vm.textIsValid.description))")
            
            TextField("Type something here..", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .background(Color(hex: "#e6e6e6"))
                .cornerRadius(10)
            
        
        }.padding()
    }
}

struct SubscriberPractise_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberPractise()
    }
}
