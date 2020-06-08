//
//  ClientProviding.swift
//  TraktSwift
//
//  Created by Martin Púčik on 07/06/2020.
//

import Foundation
#if canImport(Combine)
import Combine
#endif

public protocol ClientProviding {
    func request<Response: ResponseProviding>(_ resource: ResourceProviding, completion: ((Result<Response, Error>) -> Void)?) -> URLSessionDataTask

    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func request<Response: ResponseProviding & ResponseValidating>(_ resource: ResourceProviding) -> AnyPublisher<Response, Error>
}
