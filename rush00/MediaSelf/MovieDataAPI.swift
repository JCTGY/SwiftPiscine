//
//  MovieDataAPI.swift
//  MediaSelf
//
//  Created by jeffrey chiang on 10/6/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation

class MovieDataAPI {
    
    let baseURL = "https://api.themoviedb.org/3"
    let APIKey = "30ef26c14fd01093fbf61368cb1cfd9d"
    let fetchURL = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=30ef26c14fd01093fbf61368cb1cfd9d&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=true&page=1")
    
    let urlSession = URLSession.shared
    
    private let jsonDecoder: JSONDecoder = {
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    func fetchMovie(sucesseHandler: @escaping (MovieStats?) -> ()){
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
                let object = try self.jsonDecoder.decode(MovieStats.self, from: data)
                sucesseHandler(object)

//                print(object)
            } catch {
                print("decode fail")
                return
            }
        }.resume()
        
    }
    
    func fetchVideos(movieID: Int){
        
        let movieURL = URL(string: String("https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=30ef26c14fd01093fbf61368cb1cfd9d&language=en-US"))
        urlSession.dataTask(with: movieURL!){(data, response, error) in
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
                let object = try decoder.decode(MovieVideos.self, from: data)

//                print(object)
            } catch {
                print("decode fail")
                return
            }
        }.resume()
    }
}
