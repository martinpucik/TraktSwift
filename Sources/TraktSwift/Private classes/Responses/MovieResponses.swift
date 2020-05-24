//
//  MovieResponses.swift
//  TraktSwift
//
//  Created by Martin Púčik on 03/05/2020.
//

import Foundation

public struct MovieTrendingResponse: ResponseProtocol {
    public let trendingMovies: [MovieTrending]

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        trendingMovies = try container.decode([MovieTrending].self)
    }
}

public struct MoviePopularResponse: ResponseProtocol {
    public let movies: [Movie]

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        movies = try container.decode([Movie].self)
    }
}

public struct MovieMostPlayedResponse: ResponseProtocol {
    public let movies: [MovieMostPlayed]

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        movies = try container.decode([MovieMostPlayed].self)
    }
}
