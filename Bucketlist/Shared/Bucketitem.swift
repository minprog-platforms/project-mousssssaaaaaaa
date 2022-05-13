//
//  BucketItem.swift
//  Bucketlist
//
//  Created by Moussa Idaassi on 02/05/2022.
//

import Foundation

struct B_Item: Identifiable {
    var id = UUID()
    var task: String
    var reward: String
    var complete = false
}

let testData = [
    B_Item(task: "Read Anne Frank", reward: "20"),
    B_Item(task: "Learn how to fix a bike", reward: "50")
]
