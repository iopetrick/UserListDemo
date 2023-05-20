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
    @objc let city: String?
    @objc let state: String?
    @objc let country: String?
    @objc let postcode: String?
    @objc let dob: Date?
    @objc let registered_date: Date?
    
    public init(id: String, firstName: String, lastName: String, email: String, image_large: URL?, image_small: URL?, city: String?, state: String?, country: String?, postcode: String?, dob: Date?, registered_date: Date?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.image_large = image_large
        self.image_small = image_small
        self.city = city
        self.state = state
        self.country = country
        self.postcode = postcode
        self.dob = dob
        self.registered_date = registered_date
    }
}
