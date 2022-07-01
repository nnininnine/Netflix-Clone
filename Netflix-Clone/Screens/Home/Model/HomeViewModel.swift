//
//  HomeViewModel.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 1/7/2565 BE.
//

import Foundation

class HomeViewModel {
    // MARK: Properties

    let service: HomeService = .init()

    // MARK: Init

    init() {}

    // MARK: Methods

    func getPopularMovies() {
        service.getPopularMovies { _, _, _ in }
    }
}
