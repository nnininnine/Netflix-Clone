//
//  PopularMovie.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 1/7/2565 BE.
//

import Foundation

typealias PopularMovies = [PopularMovie]

struct PopularMoviesResponse: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: PopularMovies

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

struct PopularMovie: Codable {
    let posterPath: String?
    let adult: Bool
    let overview: String
    let releaseDate: String
    let genreIds: [Int]
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case adult, overview, id, title, popularity, video
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
}
