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
    @State private var isPresentingNewTaskView = false

    // Var for New item
    @State var test_itemMain: B_Item = B_Item(task: "", reward: "", complete: false)
    @State private var scenery_flag = true
    let saveAction: ()->Void
    
    // var currency
    @State var currency = Currency_progress()
    
    // var for completion
    @State private var complete = false

    var body: some View {
        
        NavigationView {
            // show bucketlist items
            List ($bucketlistitems) { $item in
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
                                
                                // Earn currency
                                currency.currency_mut(complete: item.complete, reward: item.reward)
                            }
                        }
            }
            .toolbar {
                // display current currency
                ToolbarItem(placement: .principal) {
                    Text("Currency: \(currency.currency)").buttonStyle(.bordered)
                }
                
                // Button for new item
                ToolbarItem {
                    Button("Add new") {
                        isPresentingNewTaskView.toggle()
                    }
                    .sheet(isPresented: $isPresentingNewTaskView) {
                        NavigationView {
                            NewTask(test_item: $test_itemMain)
                                .toolbar {
                                    ToolbarItem(placement: .confirmationAction) {
                                        Button("Close") {
                                            bucketlistitems.append(test_itemMain)
                                            test_itemMain = B_Item(task: "", reward: "", complete: false)
                                            isPresentingNewTaskView = false
                                            
                                            // flip scenery flag
                                            scenery_flag = scenery_flag == false
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
