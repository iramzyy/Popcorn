//
//  MovieDetailsRequest.swift
//  Popcorn
//
//  Created by Ramzy on 16/04/2021.
//

import Foundation
import Alamofire

enum MovieDetailsRequest: URLRequestBuilder {
    case getMovieDetails(id: Int)

    var path: String {
        switch self {
        case .getMovieDetails(let id):
            return "movie/\(id)"
        }
    }
    
    var parameters: Parameters? {
        let param = defaultParams
        switch  self {
        case .getMovieDetails:
            break
        }
        return param
    }
    
    var method: HTTPMethod {
        switch self {

        case .getMovieDetails:
            return .get
        }
    }
}
