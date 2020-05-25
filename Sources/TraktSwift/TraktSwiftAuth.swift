//
//  TraktSwiftAuth.swift
//  TraktSwift
//
//  Created by Martin Púčik on 24/05/2020.
//

import Foundation
#if canImport(Combine)
import Combine
#endif

public extension Trakt {
    
}

// MARK: - Auth Combine

@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
public extension Trakt {
    /// Generate new codes to start the device authentication process.
    /// The `device_code` and `interval` will be used later to poll for the `access_token`
    /// The `user_code` and `verification_url` should be presented to the user as mentioned in the flow steps above.
    static var generateDeviceCode: AnyPublisher<AuthGenerateDeviceCodeResponse, Error> {
        Client.request(Resource.Auth.generateDeviceCode)
    }

    static func requestDeviceToken(deviceCodeResponse: AuthGenerateDeviceCodeResponse) -> AnyPublisher<AuthRequestDeviceTokenResponse, Error> {
        Client.request(Resource.Auth.requestDeviceToken(deviceCodeResponse: deviceCodeResponse))
    }
}
