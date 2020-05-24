//
//  AuthResponses.swift
//  TraktSwift
//
//  Created by Martin Púčik on 24/05/2020.
//

import Foundation

public struct AuthGenerateDeviceCodeResponse: ResponseProtocol {

    // MARK: - Public properties

    let deviceCode: String
    let userCode: String
    let verificationURL: URL
    let expiresIn: Int
    let interval: Int

    // MARK: - Private properties

    private enum Keys: String, CodingKey {
        case deviceCode = "device_code"
        case userCode = "user_code"
        case verificationURL = "verification_url"
        case expiresIn = "expires_in"
        case interval
    }

    // MARK: - Lifecycle

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        deviceCode = try container.decode(String.self, forKey: .deviceCode)
        userCode = try container.decode(String.self, forKey: .userCode)
        verificationURL = try container.decode(URL.self, forKey: .verificationURL)
        expiresIn = try container.decode(Int.self, forKey: .expiresIn)
        interval = try container.decode(Int.self, forKey: .interval)
    }
}
