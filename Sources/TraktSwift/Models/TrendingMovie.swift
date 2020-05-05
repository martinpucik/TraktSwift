//
//  TrendingMovie.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public struct TrendingMovie: Decodable {
    let watchers: Int
    let movie: Movie
}
