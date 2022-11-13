//
//  HomeRouter.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

final class HomeRouter {

    static func createHomeScreen() -> HomeViewController {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
