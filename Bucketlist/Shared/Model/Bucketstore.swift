
//  Bucketstore.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 16/05/2022.
//
//  Inspired by https://developer.apple.com/tutorials/app-dev-training/persisting-data

import Foundation
import SwiftUI

class BucketStore: ObservableObject {
    @Published var bucketI: [B_Item] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
        .appendingPathComponent("bucketI.data")
    }

    static func load(completion: @escaping (Result<[B_Item], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let B_Item = try JSONDecoder().decode([B_Item].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(B_Item))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(bucketI: [B_Item], completion: @escaping (Result<Int, Error>)->Void) {
        
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(bucketI)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(bucketI.count))
                    print ("save succes")
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                    print ("save failed")
                }
            }
        }
    }
}
