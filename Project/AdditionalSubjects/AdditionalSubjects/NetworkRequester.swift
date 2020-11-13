//
//  NetworkRequester.swift
//  AdditionalSubjects
//
//  Created by Ludovic Ollagnier on 13/11/2020.
//

import UIKit

struct NetworkRequester {

    func requestImage(completion: @escaping (UIImage?) -> ()) {

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
            guard error == nil else {
                completion(nil)
                return
            }
            guard let data = data, let img = UIImage(data: data) else {
                completion(nil)
                return
            }

            DispatchQueue.main.async {
                completion(img)
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
