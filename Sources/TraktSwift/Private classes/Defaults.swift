//
//  Defaults.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import Foundation

enum Defaults {
    private static let ud: UserDefaults = UserDefaults(suiteName: "traktswift")!

    static var clientID: String {
        get {
            guard let clientID = ud.value(forKey: "client_id") as? String else {
                fatalError("TraktSwift: Failed to load TraktTV CLIENT ID from storage")
            }
            return clientID
        }
        set {
            ud.set(newValue, forKey: "client_id")
        }
    }
    static var clientSecret: String {
        get {
            guard let clientSecret = ud.value(forKey: "client_secret") as? String else {
                fatalError("TraktSwift: Failed to load TraktTV CLIENT SECRET from storage")
            }
            return clientSecret
        }
        set {
            ud.set(newValue, forKey: "client_secret")
        }
    }
}
