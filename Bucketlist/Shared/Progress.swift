//
//  Progress.swift
//  Bucketlist
//
//  Created by Moussa Idaassi on 29/04/2022.
//

import SwiftUI

struct Currency_progress: Codable {
    var currency = 0
    
    // logic for earning currency
    mutating func currency_mut (complete: Bool, reward: String) {
        if (complete == true) {
            currency = currency + (Int(reward) ?? 0) }
    }
        
    // logic for buying item
    mutating func currency_spending (price: String) {
        currency = currency - (Int(price) ?? 0) }
}
