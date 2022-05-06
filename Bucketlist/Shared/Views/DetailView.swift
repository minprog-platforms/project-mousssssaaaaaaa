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
    
    @State private var description: String = ""
    
    @State private var reward: String = ""
    
    var body: some View {
        
        Text("Create a new bucketlist item")
        Form {
            Text("Description")
            
            TextField(
                "",
                text: $description
            )
    //        .onSubmit {
    //
    //        }
            
            Text("Reward")
            
            TextField(
                "",
                text: $reward
            )
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
    
