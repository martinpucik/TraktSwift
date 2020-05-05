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
    static var trending: Resource { Resource(path: "/movies/trending") }
    static var popular: Resource { Resource(path: "/movies/popular") }
    static func mostPlayed(_ period: TimePeriod) -> Resource {
        Resource(path: "/movies/player/\(period)")
    }

}
