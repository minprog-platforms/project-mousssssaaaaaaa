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
    @StateObject private var curr = Progress_Store()

    var body: some View {

        TabView {
            ViewList(bucketlistitems: $store.bucketI) //, currency: $curr.cur
            {
                BucketStore.save(bucketI: store.bucketI) { result in
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
            }
            .tabItem() {
                Image("list.bullet")
                Text("BucketList")
            }
            
            ViewShop(shoplistitems: $storeI.shopI) {
                ShopStore.save(shopI: storeI.shopI) { result in
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
            }
            .tabItem() {
                Image("cart")
                Text("Shop")
            }
        }
    }
}
