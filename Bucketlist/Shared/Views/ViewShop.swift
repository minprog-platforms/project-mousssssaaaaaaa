//
//  ViewShop.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI

struct ViewShop: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    // Load items
    @Binding var shoplistitems: [S_Item]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewTaskView = false
    let saveActionI: ()->Void
    
    // currency
    @State var currency = Currency()
    
    // Show when completed
    @State private var complete = false
    @State private var isDisplayed = false
    
    //New item in sheet
    @State var shop_itemMain: S_Item = S_Item(item: "", price: "")
    
    // New item
    @State var showingDetail = false
    
    var body: some View {
        
        NavigationView {
            // show bucketlist items
            List ($shoplistitems) { $item in
                VStack(alignment: .leading){
                    Color (.blue)
                    Text(item.item)
                        .bold()
                    Text("Reward: \(item.price)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    //Color.blue
                    Button("Buy!") {
                        // decrease currency with price
                        }
                    }
            }

            .toolbar {
                // display current currency
                ToolbarItem(placement: .principal) {
                    Text("Currency: \(currency.currency)")
                }
                
                // Button for new item
                ToolbarItem {
                    Button("Add new") {
                        isPresentingNewTaskView.toggle()
                    }
                    .sheet(isPresented: $isPresentingNewTaskView) {
                        NavigationView {
                            NewItem(test_item: $shop_itemMain)
                                .toolbar {
                                    ToolbarItem(placement: .confirmationAction) {
                                        Button("Close") {
                                            shoplistitems.append(shop_itemMain)
                                            shop_itemMain = S_Item(item: "", price: "")
                                            isPresentingNewTaskView = false
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveActionI() }
        }
        }
    }


struct ViewShop_Previews: PreviewProvider {
    static var previews: some View {
        ViewShop(shoplistitems: .constant(testData_S), saveActionI: {})
    }
}


