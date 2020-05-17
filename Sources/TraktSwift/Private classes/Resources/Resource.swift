//
//  Resource.swift
//  TraktSwift
//
//  Created by Martin Púčik on 03/05/2020.
//

import Foundation

// MARK: - ResourceProtocol

enum HttpMethod: String {
    case GET
    case PUT
    case POST
    case DELETE
    case HEAD
}

protocol ResourceProtocol {
    var baseURL: URL { get }
    var method: HttpMethod { get }
    var path: String { get }
    var parameters: [String: String]? { get }
    var headers: [String: String]? { get }
    var urlRequest: URLRequest { get }
}

extension ResourceProtocol {
    var defaultHeaders: [String: String] {
        return [
            "Content-Type": "application/json",
            "trakt-api-version": "2",
            "trakt-api-key": Defaults.clientID
        ]
    }
}

// MARK: - Resource

struct Resource: ResourceProtocol {
    #if TESTING
    let baseURL: URL = URL(string: "https://api-staging.trakt.tv")!
    #else
    let baseURL: URL = URL(string: "https://api.trakt.tv")!
    #endif

    let path: String
    let method: HttpMethod

    let parameters: [String: String]?
    let headers: [String: String]?

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
        return request
    }

    // MARK: - Lifecycle

    init(path: String, method: HttpMethod = .GET, parameters: [String: String]? = nil, headers: [String: String]? = nil) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
}
