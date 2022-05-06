//
//  ContentView.swift
//  Shared
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        TabView {
            ViewList(Bucketlistitems: testData)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

