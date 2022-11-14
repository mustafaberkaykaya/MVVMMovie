//
//  MovieCellModel.swift
//  UIComponents
//
//  Created by Berkay on 13.11.2022.
//

import Foundation

public protocol MovieCellDataSource: AnyObject {
    var movieImageView: String? { get set }
    var movieTitle: String? { get set }
}

public protocol MovieCellEventSource: AnyObject {
    
}

public protocol MovieCellProtocol: MovieCellDataSource, MovieCellEventSource {
    
}

public final class MovieCellModel: MovieCellProtocol {
    
    public var movieImageView: String?
    public var movieTitle: String?
    
    public init(movieImageView: String?, movieTitle: String?) {
        self.movieImageView = movieImageView
        self.movieTitle = movieTitle
    }
}
