//
//  SwiftUITransformaleTypeApp.swift
//  SwiftUITransformaleType
//
//  Created by Shin yongjun on 2022/11/19.
//

import SwiftUI

@main
struct SwiftUITransformaleTypeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
