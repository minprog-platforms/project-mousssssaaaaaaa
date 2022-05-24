//
//  ViewList.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/04/2022.
//
import SwiftUI

struct ViewList: View {
    
    // var for items
    @Binding var bucketlistitems: [B_Item]

    // Var for New item
    @State var new_task: B_Item = B_Item(task: "", reward: "", complete: false)
    @State private var isPresentingNewTaskView = false
    @State private var scenery_flag = true
    let saveAction: ()->Void
    
    // var currency
    //@Binding var currency : [Currency_progress]
    @State var currency = Currency_progress()
    
    // var for completion
    @State private var complete = false

    var body: some View {
        
        NavigationView {
            let regular_list = $bucketlistitems //*var
            
            // show bucketlist items
            List (regular_list) { $item in
                    VStack(alignment: .leading){
                        Color (.blue)
                        Text(item.task)
                            .bold()
                        Text("Reward: \(item.reward)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Toggle("Complete", isOn: $item.complete)
                            .tint(.blue)
                            .onChange(of: item.complete) {
                                _ in saveAction()
                                
                                // earn currency
                                currency.currency_mut(complete: item.complete, reward: item.reward)
                                
                                // shuffle list??????????????????????????????????
                                // regular_list = $bucketlistitems.shuffled()
                            }
                        }
            }
            .toolbar {
                // display current currency
                ToolbarItem(placement: .principal) {
                    Text("Currency: \(currency.currency)").buttonStyle(.bordered)
                }
                
                // button/ menu for new item
                ToolbarItem {
                    Button("Add new") {
                        isPresentingNewTaskView.toggle()
                    }
                    .sheet(isPresented: $isPresentingNewTaskView) {
                        NavigationView {
                            NewTask(test_item: $new_task)
                            
                            .toolbar {
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Close") {
                                        
                                        // add items with descriptions
                                        if (new_task.task != "") {
                                            bucketlistitems.append(new_task)
                                        }
                                        new_task = B_Item(task: "", reward: "", complete: false)
                                        
                                        // flip scenery flag
                                        scenery_flag = scenery_flag == false
                                        
                                        // close sheet
                                        isPresentingNewTaskView = false
                                    }
                                }
                            }
                        }
                    }
                    .onChange(of: scenery_flag) { _ in
                        saveAction()
                    }
                }
            }
        }
    }
}

struct ViewList_Previews: PreviewProvider {
    static var previews: some View {
        ViewList(bucketlistitems: .constant(testData), saveAction: {})
    }
}
