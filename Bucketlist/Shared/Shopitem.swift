//
//  Shopitem.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 06/05/2022.
//

import Foundation

struct S_Item: Identifiable, Codable {
    var id = UUID()
    var item: String
    var price: String
}

let testData_S = [
    S_Item(item: "Buy a videogame", price:"50"),
    S_Item(item: "Go on a fancy dinner", price: "20")
]

