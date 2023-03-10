//
//  CoinManager.swift
//  ByteCoinApp
//
//  Created by Pavel Reshetov on 01.02.2023.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(error: Error)
    func didUpdateCost(_ coinManager: CoinManager, coin: CoinModel)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "11741BA3-5E44-4E31-93F5-EC1260817B95"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String) { // create an url-string
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest (with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession (configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let coin = parseJason(safeData) {
                        delegate?.didUpdateCost(self, coin: coin)
                    }
                }
            }
                task.resume()
            }
    }
    
    func parseJason(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: coinData)
            let time = decodeData.time
            let base = decodeData.asset_id_base
            let currency = decodeData.asset_id_quote
            let rate = decodeData.rate
            
            //create an instance of CoinModel
            let coin = CoinModel(currentTime: time, baseCurrency: base, chooseCurrency: currency, currentRate: rate)
            print(String(format: "%.2f", decodeData.rate))
            return coin
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
