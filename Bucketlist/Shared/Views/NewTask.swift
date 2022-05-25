//
//  DetailView.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 06/05/2022.
//

import SwiftUI

struct NewTask: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var task: String = ""
    
    @State private var reward: String = ""
    
    @State private var complete: Bool = false
    
    @Binding var test_item : B_Item

    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Create a new bucketlist item")
                .bold()
            Form {
                Text("Description")
                TextField("", text: $task)
                
                Text("Reward")
                TextField("",text: $reward)
                
                
                Button("Submit") {
                    test_item.task = task
                    test_item.reward = reward                    
                }
        }
        }
    }
}
