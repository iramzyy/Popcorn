//
//  TrendingCellViewModel.swift
//  Popcorn
//
//  Created by Ramzy on 16/04/2021.
//

import Foundation

class TrendingCellViewModel  {
    var id: Int
    var originalTitle: String
    var releaseDate: String
    var poster: String
    var voteAverage: Double
    
    init(_ trendingMovie: TrendingResult) {
        self.id = trendingMovie.id
        self.originalTitle = trendingMovie.originalTitle
        self.releaseDate = trendingMovie.releaseDate
        self.poster = trendingMovie.posterPath
        self.voteAverage = trendingMovie.voteAverage
    }
}
