//
//  CoinModel.swift
//  ByteCoinApp
//
//  Created by Pavel Reshetov on 02.02.2023.
//

import UIKit

struct CoinModel {
    let time: String
    let baseCurrency: String
    let secondCurrency: String
    let rate: Double
    
    var rateString: String {
        return String(format: "%.2f", rate)
    }
}
