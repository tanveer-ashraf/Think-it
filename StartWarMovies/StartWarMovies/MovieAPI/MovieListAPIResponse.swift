//
//  MovieListAPIResponse.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/14/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

struct MovieListAPIResponse: Decodable {
    
  let count: Int
  let all: [Movie]
  
  enum CodingKeys: String, CodingKey {
    case count
    case all = "results"
  }
}
