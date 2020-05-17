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

enum Client {
    static func request<Response: Decodable>(_ resource: ResourceProtocol, completion: ((Result<Response, Error>) -> Void)?) -> URLSessionDataTask {
        print(resource.urlRequest)
        let task = URLSession.shared.dataTask(with: resource.urlRequest, completionHandler: { data, _ , error in
            guard let data = data else {
                completion?(.failure(error!))
                return
            }
            
//            print(try! JSONSerialization.jsonObject(with: data) as AnyObject)
            
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
    static func request<Response: Decodable>(_ resource: ResourceProtocol) -> AnyPublisher<Response, Error> {
        URLSession.shared.dataTaskPublisher(for: resource.urlRequest)
            .map { $0.data }
            .decode(type: Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}