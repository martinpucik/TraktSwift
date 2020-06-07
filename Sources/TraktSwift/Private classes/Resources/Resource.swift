//
//  Resource.swift
//  TraktSwift
//
//  Created by Martin Púčik on 03/05/2020.
//

import Foundation

struct Resource: ResourceProviding {

    let baseURL: URL = URL(string: "https://api.trakt.tv")!
    let path: String
    let method: HttpMethod

    let page: Pagination?
    let parameters: [String: String]?
    let headers: [String: String]?

    var defaultHeaders: [String: String] {
        return [
            "Content-Type": "application/json",
            "trakt-api-version": "2",
        ]
    }

    var urlRequest: URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = defaultHeaders.merging(headers ?? [:], uniquingKeysWith: { current, _  in current })

        if let parameters = parameters {
            if method == .GET {
                var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
                components?.queryItems = parameters.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
                request.url = components?.url
            } else {
                do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
                } catch {
                    preconditionFailure(error.localizedDescription)
                }
            }
        }
        if let page = page {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            let currentItems = components?.queryItems
            let pagingItems = page.urlComponentsValue.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
            components?.queryItems = pagingItems + (currentItems ?? [])
            request.url = components?.url
        }
        return request
    }

    // MARK: - Lifecycle

    init(path: String, method: HttpMethod = .GET, parameters: [String: String]? = nil,
         headers: [String: String]? = nil, clientID: String, page: Page? = nil) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.headers = headers?.merging(["trakt-api-key": clientID], uniquingKeysWith: { current, _  in current })
        self.page = page
    }
}
