//
//  AppDelegate.swift
//  MVVMMovie
//
//  Created by Berkay on 12.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        window?.makeKeyAndVisible()
        app.router.window = window
        app.router.startApplication()
        return true
    }
}
