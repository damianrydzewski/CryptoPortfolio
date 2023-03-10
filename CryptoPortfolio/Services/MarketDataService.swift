//
//  MarketDataService.swift
//  CryptoPortfolio
//
//  Created by Damian on 10/03/2023.
//

import Foundation
import Combine

class MarketDataService {
    @Published var marketData: MarketData? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getMarketData()
    }
    
    private func getMarketData(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else {return}
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedGlobalData in
                guard let self else {return}
                self.marketData = returnedGlobalData.data
                self.marketDataSubscription?.cancel()
            })
    }
}
