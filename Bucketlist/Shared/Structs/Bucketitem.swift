///  BucketItem.swift
//  Bucketlist
//
//  Created by Moussa Idaassi on 02/05/2022.
//

import Foundation

struct B_Item: Identifiable, Codable {
    var id = UUID()
    var task: String
    var reward: String
    var complete: Bool 
}
