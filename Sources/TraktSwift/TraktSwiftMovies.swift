//
//  TraktSwiftMovies.swift
//  TraktSwift
//
//  Created by Martin Púčik on 17/05/2020.
//

import Foundation
#if canImport(Combine)
import Combine
#endif

// MARK: - Movies

public extension Trakt {
    /// Returns all movies being watched right now. Movies with the most users are returned first.
    /// - Parameter completion:
    /// - Returns:
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

// MARK: - Movies Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Trakt {
    /// Returns all movies being watched right now. Movies with the most users are returned first.
    /// - Returns: Publisher with MovieTrendingResponse on success
    static var trendingMovies: AnyPublisher<MovieTrendingResponse, Error> {
        return Client.request(Resource.Movie.trending)
    }
    /// Returns the most popular movies. Popularity is calculated using the rating percentage and the number of ratings.
    /// - Returns: Publisher with MoviePopularResponse on success
    static var popularMovies: AnyPublisher<MoviePopularResponse, Error> {
        return Client.request(Resource.Movie.popular)
    }
    /// Returns the most played (a single user can watch multiple times) movies in the specified time period, defaulting to weekly.
    /// All stats are relative to the specific time period.
    /// - Parameter period:
    /// - Returns: 
    static func mostPlayerMovies(period: TimePeriod = .weekly) -> AnyPublisher<MoviePopularResponse, Error> {
        return Client.request(Resource.Movie.mostPlayed(period))
    }
}
