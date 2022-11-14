//
//  MovieCellModel + Extension.swift
//  MVVMMovie
//
//  Created by Berkay on 14.11.2022.
//

import Foundation

extension MovieCellModel {
    convenience init(movie: Search) {
        self.init(movieImageView: movie.poster,
                  movieTitle: movie.title)
    }
}
