//
//  HomeViewModel.swift
//  CryptoPortfolio
//
//  Created by Damian on 20/02/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portolioCoins: [Coin] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
