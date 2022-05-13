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
    @State var test_itemMain: B_Item = B_Item(task: "String", reward: "String")

    var body: some View {
        
        NavigationView {
            // show bucketlist items
            List (Bucketlistitems) { B_Item in
                    VStack(alignment: .leading){
                        Color (.blue)
                        Text(B_Item.task)
                            .bold()
                        Text("Reward: \(B_Item.reward)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
//                        if (test_itemMain_task != "") {
//                            Text("\(test_itemMain_task)").bold()
//                        }
//                        else {
//                            Text("empty")
//                        }
//
//                        if (test_itemMain_reward != "") {
//                            Text("\(test_itemMain_reward)")                           .font(.subheadline)
//                                .foregroundColor(.secondary)
//                        }
//                        else {
//                            Text("empty")
//                        }
                        
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
                            NewTask(test_item: $test_itemMain)
                        }
                    }
                }
            }
        }
    }
}

//func submit_new(test_itemMain_task: String, test_itemMain_reward: String) {
//    if (test_itemMain_task != "") {
//        B_Item.task = test_itemMain_task
//    }
//    else {
//        Text ("empty")
//    }
//
//    if (test_itemMain_reward != "") {
//        Text ("\(test_itemMain_reward)")
//    }
//    else {
//        Text ("empty")
//    }
//}

            
struct ViewList_Previews: PreviewProvider {
    static var previews: some View {
        ViewList(Bucketlistitems: testData)
    }
}
