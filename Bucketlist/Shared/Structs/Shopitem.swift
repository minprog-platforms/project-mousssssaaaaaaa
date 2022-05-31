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
