//
//  MovieListEndpoint.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/14/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

import Foundation

enum MovieListEndpoint {
    case movieList
    case movieDetail(String)
}

extension MovieListEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .movieList:
            guard let url = URL(string: "https://swapi.dev/api/films")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        
        case .movieDetail(let movieURL):
            
            guard let url = URL(string: movieURL)
                else {preconditionFailure("Invalid URL format")}
            
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
