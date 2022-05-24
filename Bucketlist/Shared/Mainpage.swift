//
//  ContentView.swift
//  Shared
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI
import CoreData

struct Mainpage: View {
    
    //@Environment(\.managedObjectContext) private var viewContext
    
    // persistent data
    @StateObject private var store = BucketStore()
    
    // persistent data
    @StateObject private var storeI = ShopStore()
    
//    // persistent data
//    @StateObject private var curr = Progress_Store()

    var body: some View {

        TabView {
            ViewList(bucketlistitems: $store.bucketI) {
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
                            print("fail list")
                            fatalError(error.localizedDescription)
                        case .success(let bucketI):
                            print("success list")
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
                        print("fail Shop")
                        fatalError(error.localizedDescription)
                    case .success(let shopI):
                        print("success Shop")
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

//struct Mainpage_Previews: PreviewProvider {
//    static var previews: some View {
//        Mainpage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
//
