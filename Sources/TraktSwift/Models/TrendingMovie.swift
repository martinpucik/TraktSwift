//
//  TrendingMovie.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public struct TrendingMovie: Decodable {
    public let watchers: Int
    public let movie: Movie
}
