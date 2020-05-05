//
//  Movie.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public struct Movie: Decodable {
    let title: String
    let year: Int
    let ids: Identifiers
}
