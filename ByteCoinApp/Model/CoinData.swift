//
//  CoinData.swift
//  ByteCoinApp
//
//  Created by Pavel Reshetov on 01.02.2023.
//

// this is a Json data-base
struct CoinData: Codable {
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}


    

