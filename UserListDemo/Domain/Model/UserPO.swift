//
//  UserPO.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

import Foundation

@objc
public class UserPO: NSObject {
    @objc let id: String
    @objc let firstName: String
    @objc let lastName: String
    @objc let email: String
    @objc let image_large: URL?
    @objc let image_small: URL?
    
    public init(id: String, firstName: String, lastName: String, email: String, image_large: URL?, image_small: URL?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.image_large = image_large
        self.image_small = image_small
    }
}
