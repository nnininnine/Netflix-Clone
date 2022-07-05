//
//  SearchViewModel.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 5/7/2565 BE.
//

import Foundation
import RxSwift

class SearchViewModel {
    // MARK: Properties

    let disposeBag: DisposeBag = .init()
    let discoverPublisher: PublishSubject<TitleMovies> = .init()
    private let service: SearchServiceProtocol = SearchService()

    // MARK: Init

    init() {}

    // MARK: Methods

    func getDiscoverMovies() {
        service.getDiscoverMovies { [weak self] (success: Bool, titleMovies: TitleMovies?, err: String?) in
            if success {
                guard let titleMovies = titleMovies else { return }
                self?.discoverPublisher.onNext(titleMovies)
            } else {
                print(err ?? "")
            }
        }
    }
}
