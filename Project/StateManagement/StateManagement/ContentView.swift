//
//  ContentView.swift
//  StateManagement
//
//  Created by Ludovic Ollagnier on 13/11/2020.
//

import SwiftUI

struct ContentView: View {

    @State private var textToDisplay: String = "Hello, SwiftUI!"
    @EnvironmentObject private var data: AppData

    var body: some View {
        VStack {
            Text(textToDisplay)
                .padding()
            Button("Change Text") {
                textToDisplay = textToDisplay + "!"
                data.username = data.username + "!"
            }
            Text(data.username)
                .padding()
            TextField("Username", text: $textToDisplay)
            BadgeView()
            ProfileView(username: $textToDisplay)
        }
    }
}

struct ProfileView: View {

    @Binding var username: String

    var body: some View {
        VStack {
            ZStack {
                Text(username)
                    .padding()
                    .background(Circle()
                                    .foregroundColor(.green))
            }
            TextField("Username", text: $username).background(Color.red)
        }
    }
}


struct BadgeView: View {

    @EnvironmentObject private var appData: AppData

    var body: some View {
        ZStack {
            Text(appData.username)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15.0)
                                .foregroundColor(.green))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppData(username: "Toto", age: 30))
    }
}

class AppData: ObservableObject {

    @Published var username: String
    @Published var age: Int

    init(username: String, age: Int) {
        self.username = username
        self.age = age
    }
}
