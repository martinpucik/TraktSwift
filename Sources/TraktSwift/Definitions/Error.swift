//
//  Error.swift
//  TraktSwift
//
//  Created by Martin Púčik on 15/05/2020.
//

import Foundation

public enum SearchResultError: Error {
    case scopeNotImplemented
}

public enum TraktError: Error {
    case responseValidationFailed(message: String)
}

public enum AuthError: Error {
    case deviceCodeNotAuthorizedYet
}
