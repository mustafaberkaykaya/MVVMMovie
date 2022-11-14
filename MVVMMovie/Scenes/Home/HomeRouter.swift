//
//  HomeRouter.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

final class HomeRouter {

    static func createHomeScreen() -> HomeViewController {
        let service = Service()
        let viewModel = HomeViewModel(service: service)
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
