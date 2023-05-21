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
    private(set) var age: String?
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
    
    func viewDidLoad() {
        fillData()
    }
    
    private func fillData() {
        imageURL = userPO.image_large
        
        let (ageYear, dob) = getAgeAndDob()
        age = "\(ageYear)"
        dateOfBirth = dob
        dateOfJoined = getDataOfJoin()
        fullName = userPO.firstName.appending(" ").appending(userPO.lastName)
        email = userPO.email
        city = userPO.city
        state = userPO.state
        country = userPO.country
        postcode = userPO.postcode

        closureUpdateUI?()
    }
    
    private func getAgeAndDob() -> (age: Int, dobString: String) {
        guard let dob = userPO.dob else { return (0, "") }
        let ageComponent = Calendar.current.dateComponents([.year], from: dob, to: Date())
        let dobString = RelativeDates.getRelativeDateString(date: dob)
        return (ageComponent.year ?? 0, dobString)
    }
    
    private func getDataOfJoin() -> String? {
        guard let doj = userPO.registered_date else { return nil }
        return RelativeDates.getRelativeDateString(date: doj)
    }
}
