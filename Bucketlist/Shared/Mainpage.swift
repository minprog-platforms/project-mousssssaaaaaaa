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
            ViewList(Bucketlistitems: testData)
//            ViewList(Bucketlistitems: $store.bucketI)
//                .onAppear {
//                BucketStore.load { result in
//                    switch result {
//                    case .failure(let error):
//                        fatalError(error.localizedDescription)
//                    case .success(let bucketI):
//                        store.bucketI = bucketI
//                }
//            }
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

