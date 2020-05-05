//
//  File.swift
//  
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation
#if canImport(Combine)
import Combine
#endif

// MARK: - Search

public extension Trakt {
    @discardableResult
    static func search(query: String, in types: [SearchType], completion: ((Result<SearchResponse, Error>) -> Void)?) -> URLSessionDataTask {
        Client.request(resource: Resource.Search.search(query: query, types: types), completion: completion)
    }
}

// MARK: - Search Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Trakt {
    static func search(query: String, in types: [SearchType]) -> AnyPublisher<SearchResponse, Error> {
        Client.request(resource: Resource.Search.search(query: query, types: types))
    }
}
