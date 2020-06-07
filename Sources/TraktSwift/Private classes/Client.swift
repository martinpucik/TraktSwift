//
//  Client.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import Foundation
#if canImport(Combine)
import Combine
#endif

enum Client: ClientProviding {
    static func request<Response: ResponseProviding>(_ resource: ResourceProviding, completion: ((Result<Response, Error>) -> Void)?) -> URLSessionDataTask {
        let task = URLSession.shared.dataTask(with: resource.urlRequest, completionHandler: { data, response, error in
            guard let data = data else {
                completion?(.failure(error!))
                return
            }
            do {
                let resp = try JSONDecoder().decode(Response.self, from: data)
                completion?(.success(resp))
            } catch {
                completion?(.failure(error))
            }
        })
        task.resume()
        return task
    }

    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    static func request<Response: ResponseProviding & ResponseValidating>(_ resource: ResourceProviding) -> AnyPublisher<Response, Error> {
        URLSession.shared.dataTaskPublisher(for: resource.urlRequest)
            .tryCompactMap(Response.validate)
            .decode(type: Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
