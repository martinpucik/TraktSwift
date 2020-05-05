//
//  SearchResponses.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public struct SearchResponse: Decodable {
    public let results: [SearchResult]

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        results = try container.decode([SearchResult].self)
    }
}
