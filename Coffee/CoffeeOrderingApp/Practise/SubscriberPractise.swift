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
    @Published var showButton: Bool = false
    
//    var timer: AnyCancellable? // any object that can be cancelled
    
    init(){
        setupTimer()
        addTextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addButtonSubscriber() {
            $textIsValid
            .combineLatest($count)
            .sink { [weak self] (isValid, count) in
                guard let self = self else {return}
                if isValid && count >= 10 {
                    self.showButton = true
                }else {
                    self.showButton = false
                }
            }.store(in: &cancelables)
    }
    
    func addTextFieldSubscriber(){
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // to wait until typing is done for 0.5
            .map { (text) -> Bool in
                if text.count > 3 {
                    return true
                }
                return false
            }
            //.assign(to: \.textIsValid, on: self)
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
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
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0.0 :
                                vm.textIsValid ? 0.0 : 1.0)
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(vm.textIsValid ? 1.0 : 0.0)
                    }
                    .font(.headline)
                    .padding(.trailing)
                    
                    ,alignment: .trailing
                )
            
            Button(action: {}, label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .opacity(vm.showButton ? 1.0 : 0.0)
            })
            
        
        }.padding()
    }
}

struct SubscriberPractise_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberPractise()
    }
}
