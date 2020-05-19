//
//  Response.swift
//  TraktSwift
//
//  Created by Martin Púčik on 03/05/2020.
//

import Foundation

// MARK: - ResponseProtocol

public protocol ResponseProtocol: Decodable { }

public protocol ResponsePaginating: ResponseProtocol {
    var pagination: ResponsePagination { get }
}

public struct ResponsePagination {
    let currentPage: String
    let itemsPerPage: String
    let totalPageCount: String
    let totalItemCount: String
}
