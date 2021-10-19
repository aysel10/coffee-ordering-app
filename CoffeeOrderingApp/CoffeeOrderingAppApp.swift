//
//  CoffeeOrderingAppApp.swift
//  CoffeeOrderingApp
//
//  Created by icelkas on 16/10/2021.
//

import SwiftUI

@main
struct CoffeeOrderingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init(){
        setupAppearance()
    }
}

private func setupAppearance() {
    UINavigationBar.appearance().backgroundColor = UIColor(red: 26/255, green: 204/255, blue: 113/255, alpha: 100)
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

}
