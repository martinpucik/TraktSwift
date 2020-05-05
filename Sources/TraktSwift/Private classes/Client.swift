//
//  Client.swift
//  TraktSwift
//
//  Created by Martin Púčik on 02/05/2020.
//

import Foundation

enum Client {
    static func request<Response: Decodable>(resource: ResourceProtocol, completion: ((Result<Response, Error>) -> Void)?) -> URLSessionDataTask {
        print(resource.urlRequest)
        let task = URLSession.shared.dataTask(with: resource.urlRequest, completionHandler: { data, _ , error in
            guard let data = data else {
                completion?(.failure(error!))
                return
            }
            
            print(try? JSONSerialization.jsonObject(with: data) as AnyObject)
            
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
}
