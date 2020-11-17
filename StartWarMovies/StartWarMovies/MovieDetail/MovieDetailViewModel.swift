//
//  MovieDetailViewModel.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/16/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class MovieDetailViewModel: ObservableObject, MovieListService {
   
    var apiSession: APIService
    var selectedMovie: Movie
    
    init(selectedMovie: Movie, apiService: APIService = APISession()) {
        
        self.selectedMovie = selectedMovie
        self.apiSession = apiService
    }
    
    func formatDate(date:String) -> String {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy/MM/dd"
        
        if let date = dateFormatterGet.date(from: date) {
            return dateFormatterPrint.string(from: date)
        } else {
           return date
        }
    }

}
