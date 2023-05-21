//
//  StoreData.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

import Foundation

protocol StoreData {
    func storeUsers(users: [UserRS], completion: @escaping (Error?) -> Void)
}

final class StoreUserData: StoreData {
            
    func storeUsers(users: [UserRS], completion: @escaping (Error?) -> Void) {
    
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
                user.city = userModel.location.city
                user.state = userModel.location.state
                user.country = userModel.location.country
                user.postcode = userModel.location.postcode
                user.registered_date = DateFormatterHelper.toDate(date: userModel.registered.date)
                user.dob = DateFormatterHelper.toDate(date: userModel.dob.date)
            }
            
            CoreDataManager.shared.save(using: context) { completion($0) }
        }
    }
    
    
}

struct DateFormatterHelper {
    
    static let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    static func toDate(date: String) -> Date {
        guard let newDate = formatter.date(from: date) else {
            return Date()
        }
        return  newDate
    }
}

public class RelativeDates: NSObject {
    @objc class func getRelativeDateString(date: Date) -> String {
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.timeStyle = .none
        relativeDateFormatter.dateStyle = .medium
        relativeDateFormatter.locale = Locale(identifier: "en_GB")
        relativeDateFormatter.doesRelativeDateFormatting = true
        return relativeDateFormatter.string(from: date)
    }
}
