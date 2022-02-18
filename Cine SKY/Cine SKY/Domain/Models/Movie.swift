//
//  Movies.swift
//  Cine SKY
//
//  Created by Zanette Ciriaco on 16/02/22.
//

import Foundation

struct Movie: Codable {
    let ratings: Ratings
    let genres: [String]
    let releaseDate: String
    let plotOutline: PlotOutline
    let certificates: Certificates
    let title: Title
    let plotSummary: PlotSummary?
    let id: String
}

// MARK: - Certificates
struct Certificates: Codable {
    let us: [Me]

    enum CodingKeys: String, CodingKey {
        case us = "US"
    }
}

// MARK: - Me
struct Me: Codable {
    let certificateNumber: Int
    let ratingReason, country, ratingsBody, certificate: String
}

// MARK: - PlotOutline
struct PlotOutline: Codable {
    let text, id: String
}

// MARK: - PlotSummary
struct PlotSummary: Codable {
    let author, text, id: String
}

// MARK: - Ratings
struct Ratings: Codable {
    let topRank: Int?
    let canRate: Bool
    let rating: Double?
    let ratingCount: Int?
}

// MARK: - Title
struct Title: Codable {
    let image: Image
    let titleType: String
    let year: Int
    let title, id: String
    let runningTimeInMinutes: Int?
    let type: String

    enum CodingKeys: String, CodingKey {
        case image, titleType, year, title, id, runningTimeInMinutes
        case type = "@type"
    }
}

// MARK: - Image
struct Image: Codable {
    let width: Int
    let url: String
    let height: Int
    let id: String
}
