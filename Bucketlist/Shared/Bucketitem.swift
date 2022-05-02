//
//  BucketItem.swift
//  Bucketlist
//
//  Created by Moussa Idaassi on 02/05/2022.
//

import Foundation

struct Sandwich: Identifiable {
    var id = UUID()
    var task: String
    var reward: Int32
}

let testData = [
    Sandwich(task: "A", reward: 5)
]
