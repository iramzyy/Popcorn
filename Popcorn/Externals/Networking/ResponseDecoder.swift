//
//  ResponseDecoder.swift
//  Popcorn
//
//  Created by Ramzy on 15/04/2021.
//

import Foundation

protocol ResponseDecoder: Codable {
    init(data: Data) throws
}

extension ResponseDecoder  {
    init(data: Data) throws {
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}
