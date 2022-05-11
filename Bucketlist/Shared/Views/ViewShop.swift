//
//  ViewShop.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI

struct ViewShop: View {
    
    // currency view
    @State var currency = Currency()
    
    // New item
    @State var showingDetail = false
    
    // load items
    var Shoplistitems: [S_Item] = []
    
    var body: some View {
        
        NavigationView {
            // show bucketlist items
            List (Shoplistitems) { S_Item in
                ZStack {
                    VStack(alignment: .leading) {
                        Text(S_Item.item)
                            .bold()
                        Text("Price: \(S_Item.price)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                //Color.blue
                Button("Buy!") {
                    
                }
            }//.listStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=List Style@*/DefaultListStyle()/*@END_MENU_TOKEN@*/)
            
            .toolbar {
                // display current currency
                ToolbarItem(placement: .principal) {
                    Text("Currency: \(currency.currency)").buttonStyle(.bordered)
                }
                
                // Button for new item
                ToolbarItem {
                    Button(action: {
                        self.showingDetail.toggle()
                    }) {
                        Text("Add new ")
                    }.sheet(isPresented: $showingDetail) {
                        DetailView_S()
                    }
            }
        }
    }
}
}

struct ViewShop_Previews: PreviewProvider {
    static var previews: some View {
        ViewShop()
    }
}


