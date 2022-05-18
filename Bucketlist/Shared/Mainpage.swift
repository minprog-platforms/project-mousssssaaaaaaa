//
//  ContentView.swift
//  Shared
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI
import CoreData

struct Mainpage: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // persistent data
    @StateObject private var store = BucketStore()
    
    var body: some View {
        // Color.orange
        TabView {
            // ViewList(Bucketlistitems: testData)
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
                            print("fail")
                            fatalError(error.localizedDescription)
                        case .success(let bucketI):
                            print("success")
                            store.bucketI = bucketI
                        }
                    }
                }
                .tabItem() {
                    Image("list.bullet")
                    Text("BucketList")
                }
            
            ViewShop(Shoplistitems: testData_S)
                .tabItem() {
                    Image("cart")
                    Text("Shop")
                }
        }
    }
}

struct Mainpage_Previews: PreviewProvider {
    static var previews: some View {
        Mainpage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

