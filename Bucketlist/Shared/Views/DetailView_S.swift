//
//  DetailView_S.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 06/05/2022.
//

import SwiftUI

struct DetailView_S: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var item: String = ""
    
    @State private var price: String = ""
    
    var body: some View {
        
        Text("Create a new shoplist item")
            .bold()
        Form {
            Text("Item")
            
            TextField(
                "",
                text: $item
            ).keyboardType(.default)
    //        .onSubmit {
    //
    //        }
            
            Text("Price")
            
            TextField(
                "",
                text: $price
            )
        }
        // display back to homescreen
        Button("Save and return") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
            
struct DetailView_S_Previews: PreviewProvider {
    static var previews: some View {
        ViewShop(Shoplistitems: testData_S)
    }
}
 
