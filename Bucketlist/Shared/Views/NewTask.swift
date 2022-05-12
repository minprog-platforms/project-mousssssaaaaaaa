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
    
    @Binding var test_item: Bool //B_Item

    
    var body: some View {
        VStack(spacing: 20.0) {
            Button("Add new") {
                test_item.toggle()
            }
        }
        
        
        
        
//        Button(action: {
//            test_item.toggle()
//        }
//
//        Text("Create a new bucketlist item")
//            .bold()
//        Form {
//            Text("Description")
//            TextField("", text: $task)
////            .onSubmit {
////                // Change B_Item
////                test_item.toggle()
////            }
//
//            Text("Reward")
//            TextField("",text: $reward)
//            .onSubmit {
//                // Change B_Item
//            }
//        }
        // display back to homescreen
        Button("Save and return") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
            
struct NewTaskPreview: PreviewProvider {
    static var previews: some View {
        ViewList(Bucketlistitems: testData)
    }
}
    
