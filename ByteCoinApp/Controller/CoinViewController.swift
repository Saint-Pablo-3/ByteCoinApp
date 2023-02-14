//
//  ViewController.swift
//  ByteCoinApp
//
//  Created by Pavel Reshetov on 01.02.2023.
//

import UIKit

class CoinViewController: UIViewController {
    
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager() //instance of CoinManager model

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set View Controller as datasource and delegate of currencyPicker
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        //set View Controller as CoinManager delegate
        coinManager.delegate = self
    }
}

//MARK: - UIPickerViewDataSource
extension CoinViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1 // number of columns
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count // number of rows
    }
}

//MARK: - UIPickerViewDelegate
extension CoinViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row] // return String value of array[row]'s element
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectedCurrency = coinManager.currencyArray[row] 
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

//MARK: - CoinManagerDelegate
extension CoinViewController: CoinManagerDelegate {
    
    func didUpdateCost(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.currencyLabel.text = coin.rateString
            self.secondLabel.text = coin.chooseCurrency
        }
    }
    
    func didFailWithError(error: Error) {
        print("data error")
    }
    
}
