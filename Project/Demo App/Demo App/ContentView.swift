//
//  ContentView.swift
//  Demo App
//
//  Created by Ludovic Ollagnier on 19/10/2020.
//

import SwiftUI

struct ContentView: View {

    @State var washes: [HandWash] = []

    var body: some View {
        VStack {
            HStack {
                Button("Savon") {
                    var wash = HandWash(soap: "Savon", date: Date())
                    washes.append(wash)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.green))
                Button("Gel") {
                    var wash = HandWash(soap: "Gel", date: Date())
                    self.washes.append(wash)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.green))
            }
            Text("\(washes.count) lavages")
            List(washes, id: \.date) { wash in
                VStack(alignment: .leading) {
                    Text(wash.date, style: .relative)
                    Text(wash.soap)
                        .font(.footnote)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
