//
//  Demo_AppApp.swift
//  SoapWatch WatchKit Extension
//
//  Created by Ludovic Ollagnier on 19/10/2020.
//

import SwiftUI

@main
struct Demo_AppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
