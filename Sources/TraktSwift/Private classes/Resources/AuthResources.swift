//
//  AuthResources.swift
//  TraktSwift
//
//  Created by Martin Púčik on 24/05/2020.
//

import Foundation

extension Resource {
    enum Auth {}
}

extension Resource.Auth {
    static var generateDeviceCode: Resource {
        Resource(path: "/oauth/device/code", method: .POST, parameters: ["client_id": Defaults.clientID])
    }
}
