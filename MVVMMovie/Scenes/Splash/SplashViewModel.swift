//
//  SplashViewModel.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

import Foundation

protocol SplashViewDataSource {}

protocol SplashViewEventSource {}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {}

final class SplashViewModel: BaseViewModel, SplashViewProtocol {

}
