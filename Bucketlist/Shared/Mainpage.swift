//
//  ContentView.swift
//  Shared
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI
import CoreData

struct Mainpage: View {
    
    // persistent data
    @StateObject private var store = BucketStore()
    @StateObject private var storeI = ShopStore()
    @StateObject private var curr_store = Progress_Store()
    @StateObject private var trophies = AchievedStore()

    var body: some View {

        TabView {
            ViewList(bucketlistitems: $store.bucketI, currency: $curr_store.cur, trophies: $trophies.trophy) {
                BucketStore.save(bucketI: store.bucketI)
                { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
                Progress_Store.save(cur: curr_store.cur) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
                AchievedStore.save(trophy: trophies.trophy) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .onAppear {
                BucketStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let bucketI):
                        store.bucketI = bucketI
                    }
                }
                Progress_Store.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let cur):
                        curr_store.cur = cur
                    }
                }
            }
            .tabItem() {
                Image("list.bullet")
                Text("BucketList")
            }
            
            ViewShop(shoplistitems: $storeI.shopI, currency: $curr_store.cur) {
                ShopStore.save(shopI: storeI.shopI) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
                Progress_Store.save(cur: curr_store.cur) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .onAppear {
                ShopStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let shopI):
                        storeI.shopI = shopI
                    }
                }
                Progress_Store.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let cur):
                        curr_store.cur = cur
                    }
                }
            }
            .tabItem() {
                Image("cart")
                Text("Shop")
            }

            ViewTrophies(trophies: $trophies.trophy) {
                AchievedStore.save(trophy: trophies.trophy) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .onAppear {
                AchievedStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let trophy):
                        trophies.trophy = trophy
                    }
                }
            }
            .tabItem() {
                Image("check")
                Text("Achievements")
            }
        }
    }
}
