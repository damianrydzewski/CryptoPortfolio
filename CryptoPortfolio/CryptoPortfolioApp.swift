//
//  CryptoPortfolioApp.swift
//  CryptoPortfolio
//
//  Created by Damian on 18/02/2023.
//

import SwiftUI

@main
struct CryptoPortfolioApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
