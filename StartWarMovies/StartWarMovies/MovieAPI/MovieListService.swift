//
//  MovieListService.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/15/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

import Foundation
import Combine

protocol MovieListService {
    var apiSession: APIService {get}
    
    func getMovieList() -> AnyPublisher<MovieListAPIResponse, APIError>
}

extension MovieListService {
    
    func getMovieList() -> AnyPublisher<MovieListAPIResponse, APIError> {
        return apiSession.request(with: MovieListEndpoint.movieList)
            .eraseToAnyPublisher()
    }

}
