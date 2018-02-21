//
//  CoinBaseInfoModel.swift
//  CryptoX
//
//  Created by YAUHENI IVANIUK on 2/21/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import Foundation

struct CoinInfo{
    private(set) public var symbol: String
    private(set) public var coinName: String
    private(set) public var coinID: String
    private(set) public var imageUrl: String
    private(set) public var convertTo: String
    
    init(symbol: String, coinName: String, coinID: String, imageUrl: String, convertTo: String) {
        self.symbol = symbol
        self.coinName = coinName
        self.coinID = coinID
        self.imageUrl = imageUrl
        self.convertTo = convertTo
    }
}
