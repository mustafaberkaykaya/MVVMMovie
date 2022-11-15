//
//  DetailViewModel.swift
//  MVVMMovie
//
//  Created by Berkay on 14.11.2022.
//

import Foundation
import FirebaseAnalytics

protocol DetailViewDataSource {
    var movieImage: URL? { get }
    var moviesDetail: MoviesDetail? { get set }
}

protocol DetailViewEventSource {
    var fetchedDetailValues: VoidClosure? { get }
}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource { }

final class DetailViewModel: BaseViewModel, DetailViewProtocol {
    
    private var service: ServiceProtocol
    
    var moviesDetail: MoviesDetail?
    var movieImage: URL?
    var movie: Search
    var fetchedDetailValues: VoidClosure?
    
    init(movie: Search, service: ServiceProtocol) {
        self.movie = movie
        self.service = service
        self.movieImage = movie.poster?.convertUrl
    }
}

// MARK: - Requests
extension DetailViewModel {
    
    func getMovieDetailRequest() {
        showLoading?()
        service.searchDetailMovie(imdbId: movie.imdbID!) { moviesDetail in
            self.logToFirebase(detail: moviesDetail)
            self.moviesDetail = moviesDetail
            self.fetchedDetailValues?()
            self.hideLoading?()
        } onError: { error in
            EntryKitHelper.show(error?.localizedDescription, type: .error)
            self.hideLoading?()
        }
    }
    
    private func logToFirebase(detail: MoviesDetail?) {
        Analytics.logEvent("MovieDetail", parameters: [
            "movieYear": detail?.year ?? "",
            "movieName": detail?.title ?? "",
            "moviePoint": detail?.imdbRating ?? "",
        ])
    }
}
