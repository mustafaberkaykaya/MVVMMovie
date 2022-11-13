//
//  SplashViewModel.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

import Foundation
import FirebaseRemoteConfig
import Alamofire

protocol SplashViewDataSource {
    var routeDelegate: SplashViewRouteDelegate? { get set }
}

protocol SplashViewRouteDelegate: AnyObject {
    func goToHomePage()
}

protocol SplashViewEventSource {
    var updateTitle: StringClosure? { get set }
}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {
    func viewDidLoad()
}

final class SplashViewModel: BaseViewModel, SplashViewProtocol {
    
    // Privates
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    // EventSource
    var updateTitle: StringClosure?
    
    // DataSource
    weak var routeDelegate: SplashViewRouteDelegate?
    
    func viewDidLoad() {
        configureRemoteConfig()
        if  NetworkReachabilityManager()?.isReachable ?? false {
            fetchRemoteConfigValue()
        } else {
            updateTitle?(L10n.Splash.nonWifi)
            EntryKitHelper.show(L10n.Splash.nonWifi, type: .error)
        }
    }
}

// MARK: - Configure
extension SplashViewModel {
    
    private func configureRemoteConfig() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
    }
}

// MARK: - Request
extension SplashViewModel {
    
    private func fetchRemoteConfigValue() {
        showLoading?()
        self.remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success, error == nil {
                self.remoteConfig.activate { _, error in
                    guard error == nil else { return }
                    guard let value = self.remoteConfig.configValue(forKey: "startingApp").stringValue else { return }
                    
                    DispatchQueue.main.async {
                        self.hideLoading?()
                        self.updateTitle?(value)
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                        guard let self = self else { return }
                        self.routeDelegate?.goToHomePage()
                    }
                }
            } else {
                EntryKitHelper.show(error?.localizedDescription, type: .error)
            }
        }
    }
}
