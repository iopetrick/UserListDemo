//
//  UserRootRS.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 20/05/23.
//

import Foundation

struct UserRootRS: Decodable {
    let info: InfoRS
    let results: [UserRS]
    
}

struct InfoRS: Decodable {
    let results: Int
    let page: Int
}

struct UserRS: Decodable {
    let id: IDRS
    let name: NameRS
    let email: String
    let registered: DateRS
    let dob: DateRS
    let picture: PictureRS
    let location: LocationRS
}

struct IDRS: Decodable {
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case value
    }
}

extension IDRS {
  init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      do {
          value = try values.decode(String.self, forKey: .value)
      } catch {
          value = UUID().uuidString
      }
      
  }
}

struct NameRS: Decodable {
    let first: String
    let last: String
}

struct DateRS: Decodable {
    let date: String
}

struct PictureRS: Decodable {
    let large: URL
    let thumbnail: URL
}

struct LocationRS: Decodable {
    let city: String
    let state: String
    let country: String
    let postcode: String
    
    enum CodingKeys: String, CodingKey {
        case city
        case state
        case country
        case postcode
    }
    
    
}

extension LocationRS {
  init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      
      city = try values.decodeIfPresent(String.self, forKey: .city) ?? ""
      state = try values.decodeIfPresent(String.self, forKey: .state) ?? ""
      country = try values.decodeIfPresent(String.self, forKey: .country) ?? ""
      do {
          postcode = try values.decode(String.self, forKey: .postcode)
      } catch {
          let newPostCode  = try? values.decodeIfPresent(Int.self, forKey: .postcode)
          postcode = "\(newPostCode ?? 0)"
      }
      
  }
}
