//
//  MovieResources.swift
//  TraktSwift
//
//  Created by Martin Púčik on 03/05/2020.
//

import Foundation

extension Resource {
    enum Movie {}
}

extension Resource.Movie {
    static func trending(page: Page) -> Resource {
        Resource(path: "/movies/trending", page: page)
    }
    static func popular(page: Page) -> Resource {
        Resource(path: "/movies/popular", page: page)
    }
    static func mostPlayed(for period: TimePeriod, page: Page) -> Resource {
        Resource(path: "/movies/played/\(period)", page: page)
    }
    static func mostWatched(for period: TimePeriod, page: Page) -> Resource {
        Resource(path: "/movies/watched/\(period)", page: page)
    }
}
