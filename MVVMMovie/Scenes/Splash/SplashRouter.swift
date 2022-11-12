//
//  SplashRouter.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

final class SplashRouter {

    static func createSplashScreen() -> SplashViewController {
        let viewModel = SplashViewModel()
        let viewController = SplashViewController(viewModel: viewModel)
        return viewController
    }
}
