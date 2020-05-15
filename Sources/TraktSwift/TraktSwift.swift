//
//  TraktSwift.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import Foundation

public enum Trakt {
    ///
    public static func prepare(clientIDKey: String = "TRAKT_CLIENT_ID_KEY") {
        guard
            let clientID = Bundle.main.infoDictionary?[clientIDKey] as? String,
            !clientID.isEmpty
        else {
            fatalError("TraktSwift: Failed to load TraktTV CLIENT ID from Bundle settings")
        }
        Defaults.clientID = clientID
    }
}

// MARK: - Movies

public extension Trakt {
    @discardableResult
    static func trendingMovies(completion: ((Result<MovieTrendingResponse, Error>) -> Void)?) -> URLSessionDataTask {
        Client.request(Resource.Movie.trending, completion: completion)
    }
    @discardableResult
    static func popularMovies(completion: ((Result<MoviePopularResponse, Error>) -> Void)?) -> URLSessionDataTask {
        Client.request(Resource.Movie.popular, completion: completion)
    }
    @discardableResult
    static func mostPlayerMovies(period: TimePeriod = .weekly, completion: ((Result<MoviePopularResponse, Error>) -> Void)?) -> URLSessionDataTask {
        Client.request(Resource.Movie.mostPlayed(period), completion: completion)
    }
}
