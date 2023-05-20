//
//  RemoteUserLoader.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

import Foundation

final public class RemoteUserLoader: NSObject {
    
    private let httpClient: HTTPClient
    private let url: URL
    private let storeData: StoreData
    
    init(httpClient: HTTPClient, url: URL, storeData: StoreData) {
        self.httpClient = httpClient
        self.url = url
        self.storeData = storeData
    }
    
    @objc public func loadUser(page: Int, limit: Int, completion: @escaping (Error?) -> Void) {
        let url = updateQueryParam(page: page, limit: limit)
        httpClient.load(url: url) { [weak self]result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(data):
                let root = strongSelf.map(data: data)
                strongSelf.storeData.storeUsers(users: root?.results ?? []) { completion($0) }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    private func updateQueryParam(page: Int, limit: Int) -> URL {
                
        var urlComponenet = URLComponents(string: url.absoluteString)
        urlComponenet!.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "results", value: "\(limit)"),
            URLQueryItem(name: "seed", value: "abc")
        ]
        
        return urlComponenet!.url!
    }
    
    private func map(data: Data?) -> UserRootRS? {
        let decoder = JSONDecoder()
        guard let data = data else {
            return nil
        }
        do {
            let root = try decoder.decode(UserRootRS.self, from: data)
            return root
        } catch {
            print(error)
        }
        return nil
    }
}
