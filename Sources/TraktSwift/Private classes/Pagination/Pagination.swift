//
//  Pagination.swift
//  TraktSwift
//
//  Created by Martin Púčik on 23/05/2020.
//

import Foundation

/// Some methods are paginated. Methods with Pagination will load 1 page of 10 items by default.
public protocol Pagination {
    /// Number of page of results to be returned. Default is 1
    var page: Int { get }
    /// Number of results to return per page. Default is 10
    var limit: Int { get }
    /// URL components raw representation
    var urlComponentsValue: [String: String] { get }
}

/// Object representing pagination for resource
public struct Page: Pagination {

    // MARK: - Public properties

    public let page: Int
    public let limit: Int

    public var urlComponentsValue: [String: String] { ["page": "\(page)", "limit": "\(limit)"] }

    public static var `default`: Page { Page(page: 1, limit: 10) }

    // MARK: - Lifecycle

    public init(page: Int, limit: Int) {
        self.page = page
        self.limit = limit
    }
}
