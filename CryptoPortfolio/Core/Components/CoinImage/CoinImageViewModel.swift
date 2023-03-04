//
//  CoinImageViewModel.swift
//  CryptoPortfolio
//
//  Created by Damian on 20/02/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    var coinImageSubscription = Set<AnyCancellable>()
    
    private let coin: Coin
    private let dataService: CoinImageService
    
    init(coin: Coin){
        self.coin = coin
        self.dataService = CoinImageService(urlString: coin.image)
        self.isLoading = true
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink(receiveCompletion: { [weak self] (_) in
                self?.isLoading = false
            }, receiveValue: { [weak self] returnedImage in
                guard let self = self else {return}
                self.image = returnedImage
            })
            .store(in: &coinImageSubscription)
    }
}
