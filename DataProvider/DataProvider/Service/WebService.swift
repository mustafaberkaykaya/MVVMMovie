//
//  WebService.swift
//  DataProvider
//
//  Created by Berkay on 13.11.2022.
//

import Alamofire

public protocol ServiceProtocol {
     func searchMovie(movieName: String, page: Int, onSuccess: @escaping (Movies?) -> (), onError: @escaping(AFError?) -> ())
     func searchDetailMovie(imdbId: String, onSuccess: @escaping (MoviesDetail?) -> (), onError: @escaping(AFError?) -> ())
}

public final class Service: ServiceProtocol {

    public init() { }
    
    public func searchMovie(movieName: String, page: Int, onSuccess: @escaping (Movies?) -> (), onError: @escaping (AFError?) -> ()) {
        ServiceManager.shared.fetch(path: Constant.ServiceEndPoint.searchMovie(searchMovieName: movieName, page: page).addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? "") { (response: (Movies)) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
    
    public func searchDetailMovie(imdbId: String, onSuccess: @escaping (MoviesDetail?) -> (), onError: @escaping (AFError?) -> ()) {
        ServiceManager.shared.fetch(path: Constant.ServiceEndPoint.searchDetailMovie(imdbId: imdbId).addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? "") { (response: (MoviesDetail)) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
