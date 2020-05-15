//
//  SearchResult.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

private enum Keys: CodingKey {
    case score, type, movie
}

public struct SearchResult: Decodable {

    // MARK: - Public properties

    public let type: SearchResultType
    public let score: Double

    // MARK: - Lifecycle

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        score = try container.decode(Double.self, forKey: .score)

        let typeValue = try container.decode(String.self, forKey: .type)
        switch typeValue {
        case SearchScope.movie.rawValue:
            let movie = try container.decode(Movie.self, forKey: .movie)
            type = SearchResultType.movie(movie)
        default:
            throw SearchResultError.scopeNotImplemented
        }
    }
}
