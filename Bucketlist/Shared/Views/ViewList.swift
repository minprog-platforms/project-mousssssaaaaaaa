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
    
    // Load items
    var Bucketlistitems: [B_Item] = []
    
    // Show when competed
    @State private var complete = false
    
    //Sheet
    @State private var showingSheet = false
    
    //New item in sheet
    @State var test_itemMain_task: String = "" //B_Item? = nil
    @State var test_itemMain_reward: String = "" //B_Item? = nil
    

    var body: some View {
        
        NavigationView {
            // show bucketlist items
            List (Bucketlistitems) { B_Item in
                    VStack(alignment: .leading){
                        Color (.blue)
                        
                        if (test_itemMain_task == "Task") {
                            Text ("yes")
                        }
                        else {
                            Text ("no")
                        }
                        
                        if (test_itemMain_reward == "Reward") {
                            Text ("yes")
                        }
                        else {
                            Text ("no")
                        }
                        
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
                        Button("Add new") {
                            showingSheet.toggle()
                        }
                        .sheet(isPresented: $showingSheet) {
                            NewTask(test_item_task: $test_itemMain_task, test_item_reward: $test_itemMain_reward)
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
