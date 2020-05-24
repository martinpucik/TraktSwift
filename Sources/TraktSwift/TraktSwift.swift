//
//  TraktSwift.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import Foundation

public enum Trakt {
    public static func prepare(
        clientIDKey: String = "TRAKT_CLIENT_ID_KEY",
        clientSecretKey: String = "TRAKT_CLIENT_SECRET_KEY"
    ) {
        guard
            let clientID = Bundle.main.infoDictionary?[clientIDKey] as? String,
            !clientID.isEmpty,
            let clientSecret = Bundle.main.infoDictionary?[clientSecretKey] as? String,
            !clientSecret.isEmpty
        else {
            fatalError("TraktSwift: Failed to load TraktTV CLIENT ID or CLIENT SECRET from Bundle settings")
        }
        Defaults.clientID = clientID
        Defaults.clientSecret = clientSecret
    }
}
