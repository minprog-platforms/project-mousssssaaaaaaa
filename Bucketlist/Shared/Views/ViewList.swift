//
//  ViewList.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI

struct ViewList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // Load items
    @Binding var bucketlistitems: [B_Item]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewTaskView = false
    let saveAction: ()->Void
    
    // currency view
    @State var currency = Currency()
    
    // Show when completed
    @State private var complete = false
    @State private var isDisplayed = false
    
    //New item in sheet
    @State var test_itemMain: B_Item = B_Item(task: "", reward: "", complete: false)


    var body: some View {
        
        NavigationView {
            // show bucketlist items
            List (bucketlistitems) { test_itemMain in
                    VStack(alignment: .leading){
                        Color (.blue)
                        Text(test_itemMain.task)
                            .bold()
                        Text("Reward: \(test_itemMain.reward)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        
                        Text("Complete: \( $test_itemMain.complete.wrappedValue ? "True" : "False")")
                        Toggle("Complete", isOn: $test_itemMain.complete)
                        
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
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
            //.listRowBackground(Color.black)
    }
}

struct ViewList_Previews: PreviewProvider {
    static var previews: some View {
        ViewList(bucketlistitems: .constant(testData), saveAction: {})
    }
}
