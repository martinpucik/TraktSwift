//
//  Identifiers.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public struct Identifiers: Decodable {
    public let trakt: Int
    public let slug: String
    public let imdb: String?
    public let tmdb: Int?
    public let tvdb: Int?
}
