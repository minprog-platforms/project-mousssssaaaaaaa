//
//  Progress.swift
//  Bucketlist
//
//  Created by Moussa Idaassi on 29/04/2022.
//

import SwiftUI

struct Currency_progress: Codable {
    var currency = 0
    
    // Logic for earning currency
    mutating func currency_mut(complete: Bool, reward: String) {
        if (complete == true) {
            currency = currency + (Int(reward) ?? 0) }
    }
}


//    // shuffle list
//    static func shuffle_list(bucketI: [B_Item]) -> [B_Item] {
//        return bucketI.shuffled()
//    }


//let shuffle = false
//if (shuffle == true) {
//    $bucketlistitems.shuffled()
//}
