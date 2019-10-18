//
//  Wikipedia.swift
//  Wikipedia
//
//  Created by jeffrey chiang on 10/18/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation

class Wikipedia {
    
    var fetchURL = URL(string: "https://en.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&titles=Wikipedia%3AOn%20this%20day%2FToday&exintro=1")
    
    let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    func fetchPage(sucesseHandler: @escaping (WikiQuery?) -> ()){
        urlSession.dataTask(with: fetchURL!){(data, response, error) in
            if error != nil {
                print("error")
                return
            }
                       
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                print("http request fail")
                return
            }

            guard let data = data else {
                print("collect data fail")
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            do {
                let object = try self.jsonDecoder.decode(WikiQuery.self, from: data)
                sucesseHandler(object)
            } catch {
                print("decode fail")
                return
            }
        }.resume()
        
    }
    
}
