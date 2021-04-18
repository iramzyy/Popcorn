//
//  MovieDetailsResponse.swift
//  Popcorn
//
//  Created by Ramzy on 16/04/2021.
//

import Foundation

struct MovieDetailsResponse: ResponseDecoder {
    let genres: [Genre]
    let id: Int
    let originalTitle, overview: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case genres, id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
    }
}

struct Genre: Codable {
    let id: Int
    let name: String
}
