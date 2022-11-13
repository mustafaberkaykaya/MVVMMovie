//
//  HomeViewModel.swift
//  MVVMMovie
//
//  Created by Berkay on 13.11.2022.
//

import Foundation

protocol HomeViewDataSource {}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {

}
