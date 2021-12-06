//
//  timerAppApp.swift
//  timerApp WatchKit Extension
//
//  Created by Joseph Walder on 06/12/2021.
//

import SwiftUI

@main
struct timerAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
