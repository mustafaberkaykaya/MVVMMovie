//
//  MoviesDetail.swift
//  DataProvider
//
//  Created by Berkay on 14.11.2022.
//

public struct MoviesDetail: Codable {
   public let title: String?
   public let year: String?
   public let plot: String?
   public let actors: String?
   public let imdbRating: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case plot = "Plot"
        case actors = "Actors"
        case imdbRating = "imdbRating"
    }
}
