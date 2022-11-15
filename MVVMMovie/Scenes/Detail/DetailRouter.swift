//
//  DetailRouter.swift
//  MVVMMovie
//
//  Created by Berkay on 14.11.2022.
//

final class DetailRouter {
    
    static func create(movie: Search) -> DetailViewController {
        let service = Service()
        let viewModel = DetailViewModel(movie: movie, service: service)
        let viewController = DetailViewController(viewModel: viewModel)
        return viewController
    }
}
