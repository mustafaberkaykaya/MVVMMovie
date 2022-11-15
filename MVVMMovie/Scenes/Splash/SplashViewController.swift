//
//  SplashViewController.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

import UIKit
import TinyConstraints

final class SplashViewController: BaseViewController<SplashViewModel> {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .interBold18
        label.textColor = .appBlue
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        subscribeViewModel()
        viewModel.viewDidLoad()
    }
}

// MARK: - UI Layout
extension SplashViewController {
    
    private func addSubViews() {
        addTitleLabel()
    }
    
    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.centerInSuperview()
    }
}

// MARK: - SubscribeViewModel
extension SplashViewController {
    
    private func subscribeViewModel() {
        viewModel.updateTitle = { [weak self] text in
            guard let self = self else { return }
            self.titleLabel.text = text
        }
    }
}

// MARK: - RoutingDelegate
extension SplashViewController: SplashViewRouteDelegate {
    
    func goToHomePage() {
        guard let window = app.router.window else { return }
        let homeViewController = HomeRouter.createHomeScreen()
        UIView.transition(with: window, duration: 1, options: .transitionFlipFromBottom, animations: {
            UIView.performWithoutAnimation {
                window.rootViewController = homeViewController
            }
        }, completion: nil)
    }
}
