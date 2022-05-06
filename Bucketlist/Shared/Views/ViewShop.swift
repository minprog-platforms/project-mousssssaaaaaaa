//
//  ViewShop.swift
//  Bucketlist (iOS)
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI

struct ViewShop: View {
    
    @State var currency = Currency()

    var body: some View {
        // add layo+ut from list
        NavigationView {
            Text("Shop")
                .toolbar {
                    ToolbarItem {
                        Text("Currency: \(currency.currency)").buttonStyle(.bordered)
                    }
            }
    }
}

struct ViewShop_Previews: PreviewProvider {
    static var previews: some View {
        ViewShop()
    }
}
}

