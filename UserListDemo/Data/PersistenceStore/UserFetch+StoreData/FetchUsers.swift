//
//  FetchUsers.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

import Foundation
import CoreData

public protocol FetchUser {
    func fetchUsers(offset: Int, limit: Int, completion: @escaping ([UserPO]?, Error?) -> Void)
}

final public class FetchUserData: FetchUser {
    
    public func fetchUsers(offset: Int, limit: Int, completion: @escaping ([UserPO]?, Error?) -> Void) {
        let fetchRequest = User.fetchRequest()
        fetchRequest.fetchLimit = limit
        fetchRequest.fetchOffset = offset
        //fetchRequest.sortDescriptors = [NSSortDescriptor(key: "registered_date", ascending: false)]
        do {
            let users = try CoreDataManager.shared.backgroundContext.fetch(fetchRequest)
            if !users.isEmpty {
                completion(self.map(users: users), nil)
            } else {
                completion(nil, NSError(domain: "Data not found", code: 0))
            }
        } catch {
            print("Error in fetching users : ", error)
            completion(nil, error)
        }
    }
    
    private func map(users: [User]) -> [UserPO] {
        return users.map { user in
                                    
            UserPO(id: user.id ?? "",
                   firstName: user.first_name ?? "",
                   lastName: user.last_name ?? "",
                   email: user.email ?? "",
                   image_large: user.image_large,
                   image_small: user.image_small,
                   city: user.city,
                   state: user.state,
                   country: user.country,
                   postcode: user.postcode,
                   dob: user.dob,
                   registered_date: user.registered_date)
        }
    }
}
