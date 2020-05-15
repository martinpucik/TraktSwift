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
    static func search(query: String, in scopes: [SearchScope], completion: ((Result<SearchResponse, Error>) -> Void)?) -> URLSessionDataTask {
        Client.request(Resource.Search.search(query: query, scopes: scopes), completion: completion)
    }
}

// MARK: - Search Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Trakt {
    static func search(query: String, in scopes: [SearchScope]) -> AnyPublisher<SearchResponse, Error> {
        Client.request(Resource.Search.search(query: query, scopes: scopes))
    }
}
