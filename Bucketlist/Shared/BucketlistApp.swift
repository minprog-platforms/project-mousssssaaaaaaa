//
//  BucketlistApp.swift
//  Shared
//
//  Created by Moussa Idaassi on 26/04/2022.
//

import SwiftUI

@main
struct BucketlistApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Mainpage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

