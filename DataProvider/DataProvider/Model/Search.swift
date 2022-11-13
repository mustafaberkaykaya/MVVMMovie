//
//  Search.swift
//  DataProvider
//
//  Created by Berkay on 13.11.2022.
//

public struct Search: Codable {
    public let title: String?
    public let year: String?
    public let imdbID: String?
    public let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
}
