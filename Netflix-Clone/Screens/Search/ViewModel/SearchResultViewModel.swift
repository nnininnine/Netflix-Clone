//
//  SearchResultViewModel.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 5/7/2565 BE.
//

import Foundation
import RxSwift

class SearchResultViewModel {
    // https://api.themoviedb.org/3/search/movie?api_key=30d68d2c4b6257b9d803cea92ee6dedc&query=gru

    // MARK: Properties

    var query: String = "" {
        didSet {
            if !query.isEmpty {
                queryMovie(with: query)
            }
        }
    }

    private let service: SearchResultServiceProtocol = SearchService()
    let resultPublisher: PublishSubject<TitleMovies> = .init()
    let disposeBag: DisposeBag = .init()

    // MARK: Init

    init() {}

    // MARK: Methods

    private func queryMovie(with text: String) {
        service.getMovieWithQuery(with: text) { [unowned self] success, movies, err in
            if success, let movies = movies {
                self.resultPublisher.onNext(movies)
            } else {
                print(err ?? "")
            }
        }
    }
}
