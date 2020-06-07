//
//  TraktSwift.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import Foundation

public struct Trakt {

    // MARK: - Private properties

    internal let clientID: String
    internal let clientSecret: String

    // MARK: - Lifecycle

    /// Initialize the TrackSwift object with TraktTV clientID and clientSecret stored
    /// in main Bundle infoDictionary
    /// - Parameters:
    ///   - clientIDKey:
    ///   - clientSecretKey:
    ///   - bundle: 
    public init(clientIDKey: String = "TRAKT_CLIENT_ID_KEY",
                clientSecretKey: String = "TRAKT_CLIENT_SECRET_KEY",
                bundle: Bundle = Bundle.main) {
        guard
            let clientID = bundle.infoDictionary?[clientIDKey] as? String,
            !clientID.isEmpty,
            let clientSecret = bundle.infoDictionary?[clientSecretKey] as? String,
            !clientSecret.isEmpty
        else {
            fatalError("TraktSwift: Failed to load TraktTV CLIENT ID or CLIENT SECRET from Bundle")
        }

        self.clientID = clientID
        self.clientSecret = clientSecret
    }
    /// Initialize the TrackSwift object directly providing your TraktTV clientID and clientSecret
    /// - Parameters:
    ///   - clientID:
    ///   - clientSecret: 
    public init(clientID: String, clientSecret: String) {
        self.clientID = clientID
        self.clientSecret = clientSecret
    }
}
