//
//  MovieListViewModel.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/14/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class MovieListViewModel: ObservableObject, MovieListService {
  
    var apiSession: APIService
    @Published var movies = [Movie]()
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getMovieList() {
        
        let cancellable = self.getMovieList()
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (movie) in
                
                for var movieObj in movie.all {
                    
                    movieObj.openingCrawl = movieObj.openingCrawl.replacingOccurrences(of: "\r", with: "")
                    movieObj.openingCrawl = movieObj.openingCrawl.replacingOccurrences(of: ".\n", with: "")
                    movieObj.openingCrawl = movieObj.openingCrawl.replacingOccurrences(of: "\n", with: " ")
                    
                    movieObj.releaseDate  = self.formatDate(date: movieObj.releaseDate)
                    self.movies.append(movieObj)
                }
                
                
        }
        cancellables.insert(cancellable)
    }
    
    func formatDate(date:String) -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy/MM/dd"
        
        if let date = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: date)
        } else {
           return date
        }
    }
    
}
