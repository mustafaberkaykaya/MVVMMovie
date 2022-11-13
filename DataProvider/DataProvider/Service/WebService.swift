//
//  WebService.swift
//  DataProvider
//
//  Created by Berkay on 13.11.2022.
//

import Alamofire

public protocol ServiceProtocol {
     func searchMovie(movieName: String, page: Int, onSuccess: @escaping (Movies?) -> (), onError: @escaping(AFError) -> ())
}

public final class Service: ServiceProtocol {
    public init() { }
    public func searchMovie(movieName: String, page: Int, onSuccess: @escaping (Movies?) -> (), onError: @escaping (AFError) -> ()) {
        ServiceManager.shared.fetch(path: Constant.ServiceEndPoint.searchMovie(searchMovieName: movieName, page: page)) { (response: Movies) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
