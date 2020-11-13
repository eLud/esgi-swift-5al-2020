//
//  NetworkRequester.swift
//  AdditionalSubjects
//
//  Created by Ludovic Ollagnier on 13/11/2020.
//

import Foundation

struct NetworkRequester {

    func requestImage() {

        // Create URL
        guard let urlImage = URL(string: "https://www.apple.com/v/mac/m1/a/images/overview/m1_hero__gayysked51ym_large_2x.jpg") else {
            fatalError("Wrong URL format")
        }

        // Get session
        let session = URLSession.shared

        // Create task
        let task = session.dataTask(with: urlImage) { (data, response, error) in
            //
        }

        // Resume task
        task.resume()

    }

}
