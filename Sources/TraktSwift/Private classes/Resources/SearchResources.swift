//
//  SearchResources.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

extension Resource {
    enum Search {}
}

extension Resource.Search {
    static func search(query: String, scopes: [SearchScope], clientID: String) -> Resource {
        let typesString = scopes.map { $0.rawValue }.joined(separator: ",")
        return Resource(path: "/search/\(typesString)", parameters: ["query": query], clientID: clientID)
    }
}
