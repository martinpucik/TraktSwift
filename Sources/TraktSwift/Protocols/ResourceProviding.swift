//
//  ResourceProviding.swift
//  TraktSwift
//
//  Created by Martin Púčik on 07/06/2020.
//

import Foundation

public enum HttpMethod: String {
    case GET
    case PUT
    case POST
    case DELETE
    case HEAD
}

public protocol ResourceProviding {
    var method: HttpMethod { get }
    var path: String { get }
    var parameters: [String: String]? { get }
    var headers: [String: String]? { get }
    var page: Pagination? { get }
    func makeUrlRequest(with base: URL) -> URLRequest
}
