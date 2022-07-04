//
//  PopularMovie.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 1/7/2565 BE.
//

import Foundation

typealias TitleMovies = [TitleMovie]

struct TitleMoviesResponse: Codable {
    let results: TitleMovies
}

struct TitleMovie: Codable {
    let posterPath: String?
    let adult: Bool
    let overview: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let backdropPath: String?
    let popularity: Double
    let voteCount: Int
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case adult, overview, id, popularity
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
}
