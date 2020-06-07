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
    static func trending(page: Page, clientID: String) -> Resource {
        Resource(path: "/movies/trending", clientID: clientID, page: page)
    }
    static func popular(page: Page, clientID: String) -> Resource {
        Resource(path: "/movies/popular", clientID: clientID, page: page)
    }
    static func mostPlayed(for period: TimePeriod, page: Page, clientID: String) -> Resource {
        Resource(path: "/movies/played/\(period)", clientID: clientID, page: page)
    }
    static func mostWatched(for period: TimePeriod, page: Page, clientID: String) -> Resource {
        Resource(path: "/movies/watched/\(period)", clientID: clientID, page: page)
    }
}
