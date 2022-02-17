//
//  APIConstants.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 16/02/22.
//

import Foundation

let ApiKey = "ee5b06dc65msh17ae2e3ab1c161bp1028c5jsn8ebc3d95c9e0"

let baseUrl = "https://imdb8.p.rapidapi.com/title/"

var MostPopularUrl: String {
    return baseUrl + "get-most-popular-movies"
}

var MovieUrl: String {
    return baseUrl + "get-overview-details"
}

