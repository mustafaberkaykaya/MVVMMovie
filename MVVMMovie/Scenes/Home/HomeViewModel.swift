//
//  HomeViewModel.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

import Foundation

protocol HomeViewDataSource {
    var numberOfItems: Int { get }
    
    func cellForItemAt(indexPath: IndexPath) -> MovieCellProtocol
}

protocol HomeViewEventSource {
    var reloadData: VoidClosure? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func searchMovie(movie: String)
    func searchRemainingMovies()
}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {
    
   // Privates
    private var service: ServiceProtocol
    private var cellItems: [MovieCellProtocol] = []
    private var timer: Timer?
    private var isSearchable = false
    private var page = 1
    private var movieName: String = ""
    
    // EventSource
    var reloadData: VoidClosure?
    
    // MARK: - DataSource
    var numberOfItems: Int {
       return cellItems.count
    }
    
   func cellForItemAt(indexPath: IndexPath) -> MovieCellProtocol {
      return cellItems[indexPath.row]
   }
    
   init(service: ServiceProtocol) {
        self.service = service
   }
}

// MARK: - Requests
extension HomeViewModel {
    
    func searchMovie(movie: String) {
        self.movieName = movie
        self.page = 1
        self.isSearchable = false
        timer?.invalidate()
        if !movie.isEmpty {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
                self.showLoading?()
                self.service.searchMovie(movieName: movie, page: self.page) { [weak self] movies in
                    guard let self = self else { return }
                    self.hideLoading?()
                    if movies?.response == "False" {
                        self.cellItems.removeAll()
                        EntryKitHelper.show(movies?.error, type: .error)
                        self.reloadData?()
                    } else {
                        self.cellItems = movies?.search?.map { MovieCellModel(movie: $0) } ?? []
                        guard let totalCount = movies?.totalCount else { return }
                        self.isSearchable = self.cellItems.count < totalCount
                        self.reloadData?()
                    }
                } onError: { error in
                    self.hideLoading?()
                    self.cellItems.removeAll()
                    EntryKitHelper.show(L10n.Home.movieError, type: .error)
                    print(error?.localizedDescription)
                    self.reloadData?()
                }
            })
        } else {
            self.cellItems.removeAll()
            reloadData?()
        }
    }
    
    func searchRemainingMovies() {
        if isSearchable {
            showLoading?()
            isSearchable = false
            page += 1
            service.searchMovie(movieName: movieName, page: page) { [weak self] movies in
                guard let self = self else { return }
                self.hideLoading?()
                if movies?.response == "False" {
                    self.isSearchable = false
                    EntryKitHelper.show(movies?.error, type: .error)
                } else {
                    let movieList = movies?.search?.map { MovieCellModel(movie: $0) } ?? []
                    self.cellItems.append(contentsOf: movieList)
                    guard let totalCount = movies?.totalCount else { return }
                    self.isSearchable = self.cellItems.count < totalCount
                    self.reloadData?()
                }
            } onError: { error in
                self.hideLoading?()
                self.isSearchable = false
                print(error?.localizedDescription)
            }
        }
    }
}
