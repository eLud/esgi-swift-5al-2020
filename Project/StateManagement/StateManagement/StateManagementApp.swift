//
//  StateManagementApp.swift
//  StateManagement
//
//  Created by Ludovic Ollagnier on 13/11/2020.
//

import SwiftUI

@main
struct StateManagementApp: App {

    @StateObject private var data = AppData(username: "Ludovic", age: 34)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
    }
}
