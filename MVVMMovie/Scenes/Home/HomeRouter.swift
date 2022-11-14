//
//  HomeRouter.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

import UIKit

final class HomeRouter {

    static func createHomeScreen() -> UINavigationController {
        let service = Service()
        let viewModel = HomeViewModel(service: service)
        let viewController = HomeViewController(viewModel: viewModel)
        viewModel.routeDelegate = viewController
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
