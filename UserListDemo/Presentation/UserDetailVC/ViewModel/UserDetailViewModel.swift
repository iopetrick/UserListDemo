//
//  UserDetailViewModel.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 21/05/23.
//

import Foundation

final class UserDetailViewModel {
    
    private let userPO: UserPO
    private(set) var imageLoader: ImageLoaderHelper
    
    private(set) var imageURL: URL?
    private(set) var fullName: String?
    private(set) var email: String?
    private(set) var dateOfJoined: String?
    private(set) var dateOfBirth: String?
    
    private(set) var city: String?
    private(set) var state: String?
    private(set) var country: String?
    private(set) var postcode: String?
    
    var closureUpdateUI: (() -> Void)?
    
    init(userPO: UserPO, imageLoader: ImageLoaderHelper) {
        self.userPO = userPO
        self.imageLoader = imageLoader
    }
    
    private func fillData() {
        imageURL = userPO.image_large
        fullName = userPO.firstName.appending(" ").appending(userPO.lastName)
        email = userPO.email
        
        city = userPO.city
        state = userPO.state
        country = userPO.country
        postcode = userPO.postcode
        
        closureUpdateUI?()
    }
}
