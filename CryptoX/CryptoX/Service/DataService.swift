//
//  DataService.swift
//  CryptoX
//
//  Created by YAUHENI IVANIUK on 2/21/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    
    static let share = DataService()
    
    var myCoins = [CoinInfo]()
    
    func getCoinBaseInfo(coinSymbol: String, convertTo: String, comletion: @escaping CompletionHandler) {
        
        Alamofire.request(URL_ALL_COINS).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                let json = JSON(data)
                let allCoinsJson = json["Data"].dictionaryValue
                let allCoins = JSON(allCoinsJson)
                let coinJSON = allCoins[coinSymbol].dictionaryValue
                guard coinJSON.count != 0 else {
                    print("error")
                    comletion(false)
                    return
                }
                let coin = JSON(coinJSON)
                let coinName = coin["CoinName"].stringValue
                let symbol = coin["Symbol"].stringValue
                let imageUrl = coin["ImageUrl"].stringValue
                let id = coin["Id"].stringValue
                
                self.getCurrentPrice(coinSymbol: symbol, currency: convertTo, comletion: { (price, status) in
                    if status {
                    self.myCoins.append(CoinInfo(symbol: symbol, coinName: coinName, coinID: id, imageUrl: imageUrl, convertTo: convertTo, currentPrice: price))
                        comletion(true)
                    } else {
                        self.myCoins.append(CoinInfo(symbol: symbol, coinName: coinName, coinID: id, imageUrl: imageUrl, convertTo: convertTo, currentPrice: nil))
                        comletion(true)
                    }
                    
                })
                
                
            } else {
                comletion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func getCurrentPrice(coinSymbol: String, currency: String, comletion: @escaping (_ price: String?, _ status: Bool) -> ()) {
        let urlPrice = "\(URL_PRICE)\(URL_FSYM)\(coinSymbol)\(URL_TSYMS)\(currency)\(URL_EXTRA)"
        
        Alamofire.request(urlPrice).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                let json = JSON(data)
                let price = json[currency].doubleValue
                
                let currensySambol = "\(price)\(self.getSymbolForCurrencyCode(code: currency))"
                
                comletion(currensySambol, true)
                
                
            } else {
                comletion(nil, false)
                debugPrint(response.result.error as Any)
            }
            
        }
    }
    
    private func getSymbolForCurrencyCode(code: String) -> String {
        let locale = NSLocale(localeIdentifier: code)
        if locale.displayName(forKey: .currencySymbol, value: code) == code {
            let newlocale = NSLocale(localeIdentifier: code.dropLast() + "_en")
            if let symbol = newlocale.displayName(forKey: .currencySymbol, value: code) {
                return symbol
            } else {
                return code
            }
        }
        if let symbol = locale.displayName(forKey: .currencySymbol, value: code) {
            return symbol
        } else {
            return code
        }
    }
    
}
