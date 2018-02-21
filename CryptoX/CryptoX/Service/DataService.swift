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
                
                self.myCoins.append(CoinInfo(symbol: symbol, coinName: coinName, coinID: id, imageUrl: imageUrl, convertTo: convertTo))
                comletion(true)
                
            } else {
                comletion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
}
