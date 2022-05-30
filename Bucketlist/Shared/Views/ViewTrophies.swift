//
//  ViewTrophies.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/05/2022.
//

import SwiftUI

struct ViewTrophies: View {
    
    // var for items
    @Binding var trophies: [A_Item]
    
    // var save
    let saveAction: ()->Void
    
    var body: some View {
        Form {
            Section(header: Text("Trophy list").font(.title).foregroundColor(.blue)) {
                List($trophies) { $trophy in
                    Text("\(trophy.task)")
                }
            }
        }
    }
}

