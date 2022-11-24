//
//  FlixBus_nativeApp.swift
//  FlixBus_native
//
//  Created by Ariuna Banzarkhanova on 16/11/22.
//

import SwiftUI

@main
struct FlixBus_nativeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(tripCard: tripCards[1])
        }
    }
}
