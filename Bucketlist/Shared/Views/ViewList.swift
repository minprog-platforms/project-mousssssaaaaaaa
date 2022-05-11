//
//  ViewList.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI

struct ViewList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // currency view
    @State var currency = Currency()
    
    // New item
    @State var showingDetail = false
    
    // Load items
    var Bucketlistitems: [B_Item] = []
    
    // Show when competed
    @State private var complete = false
    
    var body: some View {
        
        NavigationView {
            // show bucketlist items
            List (Bucketlistitems) { B_Item in
                
                ZStack {
                    VStack(alignment: .leading){
                        Color.blue
                        Text(B_Item.task)
                            .bold()
                        Text("Reward: \(B_Item.reward)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Toggle("Complete", isOn: $complete)
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
}
}
            
struct ViewList_Previews: PreviewProvider {
    static var previews: some View {
        ViewList(Bucketlistitems: testData)
    }
}
