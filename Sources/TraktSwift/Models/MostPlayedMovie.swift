//
//  MostPlayedMovie.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

private enum Keys: String, CodingKey {
    case movie
    case watcherCount = "watcher_count"
    case playCount = "play_count"
    case collectedCount = "collected_count"
}

public struct MostPlayedMovie: Decodable {
    let movie: Movie
    let watcherCount: Int
    let playCount: Int
    let collectedCount: Int

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        movie = try container.decode(Movie.self, forKey: .movie)
        watcherCount = try container.decode(Int.self, forKey: .watcherCount)
        playCount = try container.decode(Int.self, forKey: .playCount)
        collectedCount = try container.decode(Int.self, forKey: .collectedCount)
    }
}
