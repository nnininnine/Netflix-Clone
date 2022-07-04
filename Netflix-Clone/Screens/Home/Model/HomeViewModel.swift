//
//  HomeViewModel.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 1/7/2565 BE.
//

import Foundation

class HomeViewModel {
    // MARK: Properties

    private let service: HomeService = .init()

    // MARK: Init

    init() {}

    // MARK: Methods

//    func fetchData() {
//        getPopularMovies()
//    }

    func getPopularMovies(completion: @escaping (Bool, TitleMovies?, String?) -> Void) {
        let url = Constants.baseUrl + "/3/movie/popular?api_key=" + Constants.apiKey
        service.getMovies(url: url) { success, titleMovies, err in
            if success {
                completion(true, titleMovies, nil)
            } else {
                completion(false, nil, err)
            }
        }
    }

    func getUpcomingMovies(completion: @escaping (Bool, TitleMovies?, String?) -> Void) {
        let url = Constants.baseUrl + "/3/movie/upcoming?api_key=" + Constants.apiKey
        service.getMovies(url: url) { success, titleMovies, err in
            if success {
                completion(true, titleMovies, nil)
            } else {
                completion(false, nil, err)
            }
        }
    }

    func getTrendingMovies(completion: @escaping (Bool, TitleMovies?, String?) -> Void) {
        let url = Constants.baseUrl + "/3/trending/movie/day?api_key=" + Constants.apiKey
        service.getMovies(url: url) { success, titleMovies, err in
            if success {
                completion(true, titleMovies, nil)
            } else {
                completion(false, nil, err)
            }
        }
    }

    func getTrendingTv(completion: @escaping (Bool, TitleMovies?, String?) -> Void) {
        let url = Constants.baseUrl + "/3/trending/tv/day?api_key=" + Constants.apiKey
        service.getMovies(url: url) { success, titleMovies, err in
            if success {
                completion(true, titleMovies, nil)
            } else {
                completion(false, nil, err)
            }
        }
    }
    
    func getTopRated(completion: @escaping (Bool, TitleMovies?, String?) -> Void) {
        let url = Constants.baseUrl + "/3/movie/top_rated?api_key=" + Constants.apiKey
        service.getMovies(url: url) { success, titleMovies, err in
            if success {
                completion(true, titleMovies, nil)
            } else {
                completion(false, nil, err)
            }
        }
    }
}
