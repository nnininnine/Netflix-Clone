//
//  UpcomingViewModel.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 4/7/2565 BE.
//

import Foundation
import RxSwift

class UpcomingViewModel {
    // MARK: Properties

    let disposeBag: DisposeBag = .init()
    let upcomingPublisher: PublishSubject<TitleMovies> = .init()
    private let service: UpcomingService = .init()

    // MARK: Init

    init() {}

    // MARK: Methods

    func getUpcomingMovies() {
        service.getUpcomingMovies { [weak self] (success: Bool, titleMovies: TitleMovies?, err: String?) in
            if success {
                guard let titleMovies = titleMovies else { return }
                self?.upcomingPublisher.onNext(titleMovies)
            } else {
                print(err ?? "")
            }
        }
    }
}
