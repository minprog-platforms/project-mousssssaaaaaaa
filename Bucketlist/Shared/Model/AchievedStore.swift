//
//  AchievedStore.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 29/05/2022.
//
//  Inspired by https://developer.apple.com/tutorials/app-dev-training/persisting-data

import Foundation
import SwiftUI

class AchievedStore: ObservableObject {
    @Published var trophy: [A_Item] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
        .appendingPathComponent("trophy.data")
    }

    static func load(completion: @escaping (Result<[A_Item], Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let A_Item = try JSONDecoder().decode([A_Item].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(A_Item))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    static func save(trophy: [A_Item], completion: @escaping (Result<Int, Error>)->Void) {
        
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(trophy)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(trophy.count))
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

