//
//  Error.swift
//  TraktSwift
//
//  Created by Martin Púčik on 15/05/2020.
//

import Foundation

public enum SearchResultError: Error, Equatable {
    case scopeNotImplemented
}

public enum TraktError: Error, Equatable {
    case responseValidationFailed(message: String)
}

public enum AuthError: Error, Equatable {
    case deviceCodeNotAuthorizedYet
}
