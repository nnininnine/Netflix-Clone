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

    func getPopularMovies() {
        service.getPopularMovies { success, popularMovies, err in
            if success {
                print(popularMovies?.count ?? 0)
            } else {
                print("err: \(err ?? "")")
            }
        }
    }
}
