//
//  SearchResult.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public struct SearchResult: Decodable {
    public let type: SearchType
    public let score: Double

    public let movie: Movie?
}
