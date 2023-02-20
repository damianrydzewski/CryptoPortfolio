//
//  HomeViewModel.swift
//  CryptoPortfolio
//
//  Created by Damian on 20/02/2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portolioCoins: [Coin] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
