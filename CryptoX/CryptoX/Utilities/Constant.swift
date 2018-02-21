//
//  Constant.swift
//  CryptoX
//
//  Created by YAUHENI IVANIUK on 2/21/18.
//  Copyright © 2018 YAUHENI IVANIUK. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL

let URL_BASE = "https://min-api.cryptocompare.com/data/"
let URL_EXTRA = "&extraParams=cryptox"
let URL_ALL_COINS = "\(URL_BASE)all/coinlist"
let URL_PRICE = "\(URL_BASE)price?"
let URL_FSYM = "fsym="
let URL_TSYMS = "&tsyms="

let URL_IMAGE_BASE = "https://www.cryptocompare.com"
