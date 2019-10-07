//
//  utils.swift
//  Food ordering App
//
//  Created by Muraino Yakubu on 10/7/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation

class Utils {
    
   
    func getCurrency(price: Int) -> String {
        let result = Locale.availableIdentifiers.map { Locale(identifier: $0) }.first { $0.currencyCode == "NGN" }
        let value : String = "\((result?.currencySymbol ?? "") + String(price))"
        return value
    }
}
