//
//  Response.swift
//  TraktSwift
//
//  Created by Martin Púčik on 03/05/2020.
//

import Foundation

// MARK: - ResponseProtocol

public protocol ResponseProtocol: Decodable, ResponseValidating { }

// MARK: - ResponsePaginating

public protocol ResponsePaginating {
    var pagination: ResponsePagination { get }
}

public struct ResponsePagination {
    let currentPage: String
    let itemsPerPage: String
    let totalPageCount: String
    let totalItemCount: String
}

// MARK: - ResponseValidating

public protocol ResponseValidating {
    static var validate: (Data, URLResponse) throws -> Data? { get }
}

extension ResponseValidating {
    public static var validate: (Data, URLResponse) throws -> Data? {
        get {
            return { data, response in
                guard let response = response as? HTTPURLResponse else {
                    return data
                }
                let code = response.statusCode
                switch code {
                case 200..<299:
                    if code == 204 {
                        throw TraktError.noContentResponse
                    }
                    return data
                default:
                    let string = String(data: data, encoding: .utf8)
                    throw TraktError.responseValidationFailed(message: string ?? "No error provided")
                }
            }
        }
    }
}

