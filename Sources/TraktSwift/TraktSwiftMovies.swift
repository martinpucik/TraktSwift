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
    func trendingMovies(page: Page = .default, completion: ((Result<MovieTrendingResponse, Error>) -> Void)?) -> URLSessionDataTask {
        client.request(Resource.Movie.trending(page: page, clientID: clientID), completion: completion)
    }
    @discardableResult
    func popularMovies(page: Page = .default, completion: ((Result<MoviePopularResponse, Error>) -> Void)?) -> URLSessionDataTask {
        client.request(Resource.Movie.popular(page: page, clientID: clientID), completion: completion)
    }
    @discardableResult
    func mostPlayedMovies(period: TimePeriod = .weekly, page: Page = .default, completion: ((Result<MovieMostPlayedResponse, Error>) -> Void)?) -> URLSessionDataTask {
        client.request(Resource.Movie.mostPlayed(for: period, page: page, clientID: clientID), completion: completion)
    }
    
}

// MARK: - Movies Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Trakt {
    /// Returns all movies being watched right now. Movies with the most users are returned first.
    /// - Returns: Publisher with MovieTrendingResponse on success
    func trendingMovies(page: Page = .default) -> AnyPublisher<MovieTrendingResponse, Error> {
        return client.request(Resource.Movie.trending(page: page, clientID: clientID))
    }
    /// Returns the most popular movies. Popularity is calculated using the rating percentage and the number of ratings.
    /// - Returns: Publisher with MoviePopularResponse on success
    func popularMovies(page: Page = .default) -> AnyPublisher<MoviePopularResponse, Error> {
        return client.request(Resource.Movie.popular(page: page, clientID: clientID))
    }
    /// Returns the most played (a single user can watch multiple times) movies in the specified time period, defaulting to weekly.
    /// All stats are relative to the specific time period.
    /// - Parameter period:
    /// - Returns: 
    func mostPlayedMovies(period: TimePeriod = .weekly, page: Page = .default) -> AnyPublisher<MovieMostPlayedResponse, Error> {
        return client.request(Resource.Movie.mostPlayed(for: period, page: page, clientID: clientID))
    }
    /// Returns the most watched (unique users) movies in the specified time period, defaulting to weekly.
    /// All stats are relative to the specific time period.
    func mostWatchedMovies(period: TimePeriod = .weekly, page: Page = .default) -> AnyPublisher<MoviePopularResponse, Error> {
        return client.request(Resource.Movie.mostPlayed(for: period, page: page, clientID: clientID))
    }
}
