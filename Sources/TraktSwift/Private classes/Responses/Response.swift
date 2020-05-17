//
//  Response.swift
//  TraktSwift
//
//  Created by Martin Púčik on 03/05/2020.
//

import Foundation

// MARK: - ResponseProtocol

public protocol ResponseProtocol: Decodable { }

protocol ResponsePaginating: ResponseProtocol {
    var currentPage: String { get }
}
