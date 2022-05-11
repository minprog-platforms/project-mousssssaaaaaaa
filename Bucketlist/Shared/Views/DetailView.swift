//
//  DetailView.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 06/05/2022.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var task: String = ""
    
    @State private var reward: String = ""
    
    @State var test_item: B_Item
    
    var body: some View {
        
        Text("Create a new bucketlist item")
            .bold()
        Form {
            Text("Description")
            TextField("", text: $task)
            .onSubmit {
                // Change B_Item
                
            }
            
            Text("Reward")
            TextField("",text: $reward)
            .onSubmit {
                // Change B_Item
            }
        }
        // display back to homescreen
        Button("Save and return") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
            
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ViewList(Bucketlistitems: testData)
    }
}
    
