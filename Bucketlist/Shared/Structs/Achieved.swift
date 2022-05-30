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

let testData_A = [
    A_Item(task: "Read Anne Frank"),
    A_Item(task: "Learn how to fix a bike")
]
