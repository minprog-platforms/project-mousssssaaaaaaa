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
    @State private var shuffle_flag = true

    // Var for New item
    @State var new_task: B_Item = B_Item(task: "", reward: "", complete: false)
    @State private var isPresentingNewTaskView = false
    @State private var scenery_flag = true
    
    // var currency
    @Binding var currency: Currency_progress

    // var for completion
    @State private var complete = false
    @State var task_V: A_Item = A_Item(task: "")
    @Binding var trophies: [A_Item]
    
    // var save
    let saveAction: ()->Void

    var body: some View {
        
        NavigationView {
            
            // show bucketlist items
            List ($bucketlistitems) { $item in
                    VStack(alignment: .leading){
                        Color (.blue)
                        Text("$ \(item.reward)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        Text(item.task)

                        Toggle("Complete", isOn: $item.complete)
                            .tint(.blue)
                            .onChange(of: item.complete) { _ in
                                
                                // earn currency
                                currency.currency_mut(complete: item.complete, reward: item.reward)
                                
                                // flag to shuffle
                                shuffle_flag = shuffle_flag == false
                                
                                // add completed task to achievements
                                task_V.task = item.task
                                trophies.append(task_V)
                                
                                //remove completed task from bucketlist
                                let index = bucketlistitems.firstIndex(where: {$0.task == item.task})
                                bucketlistitems.remove(at: Int(index!))
                                
                                // reset placeholder
                                task_V = A_Item(task: "")
                                
                                saveAction()
                            }
                    }
            }
            // shufffle outside of sheet
            .onChange(of: shuffle_flag) { _ in
                bucketlistitems = bucketlistitems.shuffled()
                print("shuffled")
            }
            
            .toolbar {
                // display current currency
                ToolbarItem(placement: .confirmationAction) {
                    Text("$ \(currency.currency)")
                }
                
                // button/ menu for new item
                ToolbarItem (placement: .principal) {
                    Button("Add task") {
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
                                        
                                        // reset placeholder
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
