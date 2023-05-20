//
//  User+CoreDataProperties.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var first_name: String?
    @NSManaged public var id: String?
    @NSManaged public var image_large: URL?
    @NSManaged public var image_small: URL?
    @NSManaged public var last_name: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var country: String?
    @NSManaged public var postcode: String?
    @NSManaged public var dob: Date?
    @NSManaged public var registered_date: Date?

}

extension User : Identifiable {

}
