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
    static func generateDeviceCode(clientID: String) -> Resource {
        Resource(path: "/oauth/device/code", method: .POST, parameters: ["client_id": clientID], clientID: clientID)
    }

    static func requestDeviceToken(deviceCodeResponse: AuthGenerateDeviceCodeResponse, clientID: String, clientSecret: String) -> Resource {
        Resource(path: "/oauth/device/token", method: .POST, parameters: [
            "client_id": clientID,
            "client_secret": clientSecret,
            "code": deviceCodeResponse.deviceCode
        ], clientID: clientID)
    }
}
