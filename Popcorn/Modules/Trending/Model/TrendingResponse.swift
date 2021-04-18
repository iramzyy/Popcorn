//
//  TrendingResponse.swift
//  Popcorn
//
//  Created by Ramzy on 16/04/2021.
//

import Foundation

struct TrendingResponse: ResponseDecoder {
    let page: Int
    let results: [TrendingResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct TrendingResult: Codable {
    let id: Int
    let originalTitle: String
    let posterPath, releaseDate: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
