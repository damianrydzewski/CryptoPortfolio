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
    
    private var coinImageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    

    init(coin: Coin) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    
    private func getCoinImage() {
        if let savedLocalImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedLocalImage
        } else {
            downloadCoinImage()
        }
    }
    
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else {return}
        
        coinImageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoinImage in
                guard let self = self, let downloadedImage = returnedCoinImage else { return }
                self.image = downloadedImage
                self.coinImageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
