//
//  ImageDownloader.swift
//  RandomDogGenerator
//
//  Created by Vinayak.Hejib on 21/03/20.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader {
    static let shared = ImageDownloader()

    //Initiates the URLSession dataTask to start downloading the image data
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    //Downlads image for given url
    func downloadImage(from url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
        getData(from: url) { data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                completion(UIImage(data: data), nil)
            }
        }
    }
}
