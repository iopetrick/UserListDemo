//
//  StoreData.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

import Foundation

protocol StoreData {
    func storeUsers(users: [UserRS], completion: (Error?) -> Void)
}

final class StoreUserData: StoreData {
            
    func storeUsers(users: [UserRS], completion: (Error?) -> Void) {
    
        if users.isEmpty {
            completion(NSError(domain: "No data to save", code: 0))
            return
        }
        
        let container = CoreDataManager.shared.persistentContainer
        
        
        container.performBackgroundTask { context in
            
            for userModel in users {
                let user = User(context: context)
                user.id = userModel.id.value
                user.first_name = userModel.name.first
                user.last_name = userModel.name.last
                user.image_small = userModel.picture.thumbnail
                user.image_large = userModel.picture.large
                user.email = userModel.email
            }
            
            CoreDataManager.shared.save(using: context) { error in
                if error != nil {
                    print("Error")
                } else {
                    print("success")
                }
            }
        }
    }
    
    
}

