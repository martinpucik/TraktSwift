//
//  SearchResult.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public struct SearchResult: Decodable {
    let type: SearchType
    let score: Double

    let movie: Movie?
}
