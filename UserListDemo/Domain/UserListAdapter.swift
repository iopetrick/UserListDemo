//
//  UserListAdapter.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

import Foundation

/*@objc
public protocol UserListService: AnyObject {
    func loadUserList(completion: @escaping ([UserPO]?, Error?) -> Void)
}*/


public class UserListAdapter: NSObject {
    let fetchUser: FetchUser
    
    private var offset = 0
    private let limit = 10
            
    
    public init(fetchUser: FetchUser) {
        self.fetchUser = fetchUser
    }
    @objc
    public func loadUserList(completion: @escaping ([UserPO]?, Error?) -> Void) {
        fetchUser.fetchUsers(offset: offset, limit: limit) { [weak self] (usersPO, error) in
            guard let strongSelf = self else { return }
            if error != nil || (usersPO ?? []).isEmpty {
                //Either data not available or need to load more data from remote
                completion(nil, error)
                return
            } else if let usersPO = usersPO {
                strongSelf.offset += strongSelf.limit
                completion(usersPO, nil)
                return
            }
            completion(nil, nil)
        }
    }        
}
