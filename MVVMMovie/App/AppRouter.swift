//
//  AppRouter.swift
//  MVVMMovie
//
//  Created by Berkay on 12.11.2022.
//

import UIKit

final class AppRouter {

    var window: UIWindow?

    init() {}
    // swiftlint:disable all
    func startApplication() {
        guard let window = window else { fatalError("Window value cannot be nil") }
        let viewController = SplashRouter.createSplashScreen()
        window.rootViewController = viewController
    }
}
