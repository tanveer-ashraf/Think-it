//
//  APIService.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/14/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

import Foundation
import Combine
import UIKit

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
    func requestImage(with url: String) -> AnyPublisher<UIImage, APIError>
}
