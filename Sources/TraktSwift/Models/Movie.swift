//
//  Movie.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public struct Movie: Decodable {
    public let title: String
    public let year: Int
    public let ids: Identifiers
}
