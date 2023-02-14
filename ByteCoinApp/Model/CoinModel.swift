//
//  CoinModel.swift
//  ByteCoinApp
//
//  Created by Pavel Reshetov on 02.02.2023.
//

import UIKit

// protocol model
struct CoinModel {
    let currentTime: String
    let baseCurrency: String
    let chooseCurrency: String
    let currentRate: Double
    
    var rateString: String {
        return String(format: "%.2f", currentRate)
    }
}
