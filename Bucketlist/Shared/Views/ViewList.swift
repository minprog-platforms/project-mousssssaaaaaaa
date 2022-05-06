//
//  ViewList.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI

struct ViewList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var currency = Currency()
    
    var Bucketlistitems: [B_Item] = []
    
    @State var showingDetail = false
    
    var body: some View {
        
        NavigationView {
            // show bucketlist items
            List (Bucketlistitems) { B_Item in
                VStack(alignment: .leading) {
                    Text(B_Item.task)
                    Text("Reward: \(B_Item.reward)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
            }
            
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
                        DetailView()
                    }
            }
        }
    }
}
}
            
struct ViewList_Previews: PreviewProvider {
    static var previews: some View {
        ViewList(Bucketlistitems: testData)
    }
}
