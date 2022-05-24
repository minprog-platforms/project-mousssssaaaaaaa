//
//  ViewShop.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI

struct ViewShop: View {

    // var for items
    @Binding var shoplistitems: [S_Item]

    
    // var for new item
    @State var new_shopitem: S_Item = S_Item(item: "", price: "")
    @State private var isPresentingNewTaskView = false
    @State private var scenery_flag = true
    let saveActionI: ()->Void
    
    // var for currency
    @State var currency = Currency_progress()
    
    // var for completion
    @State private var complete = false
    
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
                            NewItem(test_item: $new_shopitem)
                            
                            .toolbar {
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Close") {
                                        // add items with descriptions
                                        if (new_shopitem.item != "") {
                                            shoplistitems.append(new_shopitem)
                                        }
                                        
                                        // flip scenery flag
                                        scenery_flag = scenery_flag == false
                                        
                                        //close sheet
                                        isPresentingNewTaskView = false
                                    }
                                }
                            }
                        }
                    }
                    .onChange(of: scenery_flag) { _ in
                        saveActionI()
                    }
                }
            }
        }
    }
}


struct ViewShop_Previews: PreviewProvider {
    static var previews: some View {
        ViewShop(shoplistitems: .constant(testData_S), saveActionI: {})
    }
}


