//
//  Achieved.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/05/2022.
//

import Foundation

struct A_Item: Identifiable, Codable {
    var id = UUID()
    var task: String
}
