//
//  NetworkService.swift
//  iTunesAPITest
//
//  Created by Yuriy Martinovskiy on 25.06.2021.
//

import Foundation

func request(urlString: String) {
    guard let url = URL(string: urlString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print(error)
            return
        }
        
        if let response = response {
            print(response)
        }
        
        guard let data = data else {return}
        do {
            let media = try JSONDecoder().decode(ItunesAnswer.self, from: data)
        } catch let error {
            print(error)
        }
    }.resume()
}
