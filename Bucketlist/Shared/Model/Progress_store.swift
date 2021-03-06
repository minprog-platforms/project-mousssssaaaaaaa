//
//  Progress_store.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 23/05/2022.
//

import SwiftUI

class Progress_Store: ObservableObject {
    @Published var cur: Currency_progress = Currency_progress(currency: 0)
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
        .appendingPathComponent("cur.data")
    }

    static func load(completion: @escaping (Result<Currency_progress, Error>)->Void) {
        DispatchQueue.global(qos: .background).async {
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success(Currency_progress(currency: 0)))
                    }
                    return
                }
                let Currency = try JSONDecoder().decode(Currency_progress.self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(Currency))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
        static func save(cur: Currency_progress, completion: @escaping (Result<Int, Error>)->Void) {
            DispatchQueue.global(qos: .background).async {
                do {
                    let data = try JSONEncoder().encode(cur)
                    let outfile = try fileURL()
                    try data.write(to: outfile)
                    DispatchQueue.main.async {
                        completion(.success(1))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
    }
}
