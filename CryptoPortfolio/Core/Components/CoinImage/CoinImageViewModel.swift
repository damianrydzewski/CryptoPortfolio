//
//  CoinImageViewModel.swift
//  CryptoPortfolio
//
//  Created by Damian on 20/02/2023.
//

import Foundation
import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let dataService = CoinImageService()
    
    init(){
        getImage()
    }
    
    private func getImage() {
        
    }
}
