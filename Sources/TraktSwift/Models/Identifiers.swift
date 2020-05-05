//
//  Identifiers.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public struct Identifiers: Decodable {
    let trakt: Int
    let slug: String
    let imdb: String?
    let tmdb: Int?
    let tvdb: Int?
}
