//
//  Shopstore.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 23/05/2022.
//

import Foundation
import SwiftUI

class ShopStore: ObservableObject {
    @Published var shopI: [S_Item] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
        .appendingPathComponent("shopI.data")
    }

    static func load(completion: @escaping (Result<[S_Item], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let S_Item = try JSONDecoder().decode([S_Item].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(S_Item))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
        static func save(shopI: [S_Item], completion: @escaping (Result<Int, Error>)->Void) {
            DispatchQueue.global(qos: .background).async {
                do {
                    let data = try JSONEncoder().encode(shopI)
                    let outfile = try fileURL()
                    try data.write(to: outfile)
                    DispatchQueue.main.async {
                        completion(.success(shopI.count))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
    }
}
