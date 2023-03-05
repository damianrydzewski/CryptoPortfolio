//
//  UIApplication.swift
//  CryptoPortfolio
//
//  Created by Damian on 05/03/2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
