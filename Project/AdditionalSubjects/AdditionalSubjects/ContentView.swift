//
//  ContentView.swift
//  AdditionalSubjects
//
//  Created by Ludovic Ollagnier on 13/11/2020.
//

import SwiftUI

struct ContentView: View {

    @State private var image: Image?
    let networkRequester = NetworkRequester()

    var body: some View {
        VStack {
            Button("Get image") {
                networkRequester.requestImage { (possibleImage) in
                    if let downloadedImage = possibleImage {
                        image = Image(uiImage: downloadedImage)
                    }
                }
                requestAlbum()
            }
            if let anImage = image {
                anImage
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
            }
        }
    }

    func requestAlbum() {

        guard let data = encodeAlbum() else { return }

        let decoder = JSONDecoder()

        if let album = try? decoder.decode(Album.self, from: data) {
            print(album)
        }
    }

    func encodeAlbum() -> Data? {

        let track1 = Track(title: "T1", duration: 3.5)
        let track2 = Track(title: "T2", duration: 3.5)
        let album = Album(tracks: [track1, track2])

        let jsonEncoder = JSONEncoder()
        let data = try? jsonEncoder.encode(album)

        print(String(data: data!, encoding: .utf8)!)

        return data
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Album: Codable {
    var tracks: [Track]
}

struct Track: Codable {
    var title: String
    var duration: Double
}
