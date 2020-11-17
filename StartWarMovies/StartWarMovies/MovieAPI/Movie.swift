//
//  Movie.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/14/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

struct Movie: Decodable, Identifiable {
  let id: Int
  let title: String
  var openingCrawl: String
  let director: String
  let producer: String
  var releaseDate: String
  var created : String
  var edited : String
  let starships: [String]
  
  enum CodingKeys: String, CodingKey {
    case id = "episode_id"
    case title
    case openingCrawl = "opening_crawl"
    case director
    case producer
    case releaseDate = "release_date"
    case created
    case edited
    case starships
  }
}
