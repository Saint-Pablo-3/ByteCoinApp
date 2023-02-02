//
//  CoinData.swift
//  ByteCoinApp
//
//  Created by Pavel Reshetov on 01.02.2023.
//

import Foundation

struct CoinData: Codable {
    
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}


//struct Fiat: Decodable {
//    let currency = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
//}

    

