//
//  HomeService.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 1/7/2565 BE.
//

import Foundation

class HomeService {
    // MARK: Init

    init() {}

    // MARK: Methods

    func getPopularMovies(completion: @escaping (Bool, PopularMovies?, String?) -> Void) {
        let url = Constants.baseUrl + "/3/movie/popular?api_key=" + Constants.apiKey

        print(url)
    }
}
