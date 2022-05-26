//
//  DetailView_S.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 06/05/2022.
//

import SwiftUI

struct NewItem: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var item: String = ""
    
    @State private var price: String = ""
    
    @Binding var test_item : S_Item
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Create a new shoplist item")
                .bold()
            Form {
                Text("Description")
                TextField("", text: $item)
                
                Text("$")
                TextField("",text: $price)
                
                
                Button("Submit") {
                    test_item.item = item
                    test_item.price = price
                }
        }
        }
    }
}
            
//struct NewItemPreview: PreviewProvider {
//    static var previews: some View {
//        ViewShop(shoplistitems: .constant(testData_S), saveActionI: {})
//    }
//}
// 
