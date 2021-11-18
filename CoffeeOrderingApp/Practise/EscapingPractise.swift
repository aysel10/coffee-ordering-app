//
//  EscapingPractise.swift
//  CoffeeOrderingApp
//
//  Created by Aysel on 11/18/21.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    
    @Published var text: String = "Hello"
    
    func getData() {
        downloadData5 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
//        downloadData3 { [weak self] data in
//            self?.text = data     // weak self when download from inet
//        }
    }
    
    func downloadData() -> String {
        return "New Data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> ())  {
        completionHandler("New Data")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ())  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New Data")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ())  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion)  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
    
    func doSomething(_ data: String) {  //closure func
        print(data)
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingPractise: View {
    
    @StateObject var vm = EscapingViewModel()
    
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.orange)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingPractise_Previews: PreviewProvider {
    static var previews: some View {
        EscapingPractise()
    }
}
