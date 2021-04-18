//
//  TrendingRequest.swift
//  Popcorn
//
//  Created by Ramzy on 16/04/2021.
//

import Foundation
import Alamofire

enum TrendingRequest: URLRequestBuilder {
    case getTrendingMovies

    var path: String {
        switch self {
        
        case .getTrendingMovies:
            return "movie/popular"
        }
    }
    
    var parameters: Parameters? {
        let param = defaultParams
        switch  self {
        case .getTrendingMovies:
            break
        }

        return param
    }
    
    var method: HTTPMethod {
        switch self {

        case .getTrendingMovies:
            return .get
            

        }
    }
}
