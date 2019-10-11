//
//  MovieStats.swift
//  MediaSelf
//
//  Created by jeffrey chiang on 10/6/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation

public struct MovieStats: Codable {
    
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [Movies]?
    
}

public struct Movies: Codable {
    
    public let popularity: Float
    public let voteCount: Int
    public let video: Bool
    public let posterPath: String
    public let id: Int
    public let adult: Bool
    public let backdropPath: String
    public let originalLanguage: String
    public let originalTitle: String
    public let genreIds: [Int]
    public let title: String
    public let voteAverage: Float
    public let overview: String
    public let releaseDate: String

}

public struct MovieVideos: Codable {
    
    public let id: Int
    public let results: [Videos]
}

public struct Videos: Codable {
    
    public let id: Int
//    public let iso6391: String
//    public let iso31661: String
    public let key: String
    public let name: String
    public let site: String
    public let size: Int
    public let type: String
}

