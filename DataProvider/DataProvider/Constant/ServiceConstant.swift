//
//  ServiceConstant.swift
//  DataProvider
//
//  Created by Berkay on 13.11.2022.
//

import Foundation

extension Constant {
    
    enum ServiceEndPoint: String {
        
        case baseUrl = "https://www.omdbapi.com/?"
        case apiKey = "apikey=f1b67332"
        
        static func searchMovie(searchMovieName: String, page: Int) -> String {
            "\(baseUrl.rawValue)\(apiKey.rawValue)&s=\(searchMovieName)&page=\(page)"
        }
    }
}
