//
//  CoinImageService.swift
//  CryptoPortfolio
//
//  Created by Damian on 20/02/2023.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    var coinImageSubscription: AnyCancellable?

    init(urlString: String) {
        getCoinImage(urlString: urlString)
    }
    
    private func getCoinImage(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        coinImageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoinImage in
                guard let self else {return}
                self.image = returnedCoinImage
                self.coinImageSubscription?.cancel()
            })
    }
}
