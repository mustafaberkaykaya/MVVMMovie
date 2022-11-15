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
   public let totalResult: String?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case response = "Response"
        case error = "Error"
        case totalResult = "totalResults"
    }
    
    public var totalCount: Int {
        if let count = Int(totalResult ?? "0") {
            return count
        } else {
            return 0
        }
    }
}
