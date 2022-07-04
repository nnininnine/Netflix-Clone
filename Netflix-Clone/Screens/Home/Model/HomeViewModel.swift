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
        service.getPopularMovies { success, titleMovies, err in
            if success {
                completion(true, titleMovies, nil)
            } else {
                completion(false, nil, err)
            }
        }
    }
}
