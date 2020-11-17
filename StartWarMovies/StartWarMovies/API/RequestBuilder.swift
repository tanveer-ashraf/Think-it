//
//  RequestBuilder.swift
//  StartWarMovies
//
//  Created by Tanveer Ashraf on 11/14/20.
//  Copyright © 2020 Tanveer Ashraf. All rights reserved.
//

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest {get}
}
