//
//  ApiClient.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

import Foundation

enum APIResult {
    case success(Data?)
    case failure(Error)
}

protocol HTTPClient {
    func load(url: URL, completion: @escaping (APIResult) -> Void)
}

final class ApiClient: HTTPClient {
    
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func load(url: URL, completion: @escaping (APIResult) -> Void) {
        print("URL: ", url.absoluteString)
        self.session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NSError(domain: "Invalid Data", code: 0)))
                return
            }
            
            completion(.success(data))
        }.resume()
    }
}
