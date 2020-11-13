//
//  ContentView.swift
//  AdditionalSubjects
//
//  Created by Ludovic Ollagnier on 13/11/2020.
//

import SwiftUI

struct ContentView: View {

    @State private var image: Image?

    var body: some View {
        VStack {
            Button("Get image") {
                requestImage()
            }
            if let anImage = image {
                anImage
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
            }
        }
    }

    func requestImage() {

        // Create URL
        guard let urlImage = URL(string: "https://www.apple.com/v/mac/m1/a/images/overview/m1_hero__gayysked51ym_large_2x.jpg") else {
            fatalError("Wrong URL format")
        }

        //To customize request (if needed)
        var request = URLRequest(url: urlImage)
        request.httpMethod = "POST"

        // Get session
        let session = URLSession.shared

        // Create task
        let task = session.dataTask(with: urlImage) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data, let img = UIImage(data: data) else { return }

            DispatchQueue.main.async {
                image = Image(uiImage: img)
            }

            DispatchQueue.global(qos: .utility).async {
                //Something in  background
                DispatchQueue.main.async {
                    //Go back in the main thread
                }
            }
        }

        // Resume task
        task.resume()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
