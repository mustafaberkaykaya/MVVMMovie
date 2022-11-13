//
//  Movies.swift
//  DataProvider
//
//  Created by Berkay on 13.11.2022.
//

public struct Movies: Codable {
   public let search: [Search]?
   public let response: String?
   public let error: String?
 
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case response = "Response"
        case error = "Error"
    }
}
