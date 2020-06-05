//
//  AuthResponses.swift
//  TraktSwift
//
//  Created by Martin Púčik on 24/05/2020.
//

import Foundation

// MARK: - AuthGenerateDeviceCodeResponse

public struct AuthGenerateDeviceCodeResponse: ResponseProtocol {

    // MARK: - Public properties

    public let deviceCode: String
    public let userCode: String
    public let verificationURL: URL
    public let expiresIn: Int
    public let interval: Int

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

// MARK: - AuthRequestDeviceTokenResponse

public struct AuthRequestDeviceTokenResponse: ResponseProtocol {

    // MARK: - Public properties

    public let accessToken: String
    public let refreshToken: String
    public let tokenType: String
    public let expiresIn: Int
    public let scope: String
    public let createdAt: Int

    // MARK: - Private properties

    private enum Keys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case scope
        case createdAt = "created_at"
    }

    // MARK: - Lifecycle

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        accessToken = try container.decode(String.self, forKey: .accessToken)
        refreshToken = try container.decode(String.self, forKey: .refreshToken)
        tokenType = try container.decode(String.self, forKey: .tokenType)
        expiresIn = try container.decode(Int.self, forKey: .expiresIn)
        scope = try container.decode(String.self, forKey: .scope)
        createdAt = try container.decode(Int.self, forKey: .createdAt)
    }

    public static var validate: (Data, URLResponse) throws -> Data? {
        return { data, response in
            guard let response = response as? HTTPURLResponse else {
                return data
            }
            let code = response.statusCode
            switch code {
                case 200...299:
                    return data
                case 400:
                    let string = String(data: data, encoding: .utf8) ?? ""
                    if string.isEmpty {
                        throw AuthError.deviceCodeNotAuthorizedYet
                    }
                    fallthrough
                default:
                    let string = String(data: data, encoding: .utf8)
                    throw TraktError.responseValidationFailed(message: string ?? "No error provided")
            }
        }
    }
}
