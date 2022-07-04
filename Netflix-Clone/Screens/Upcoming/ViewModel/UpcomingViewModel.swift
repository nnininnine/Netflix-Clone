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

    // MARK: Init

    init() {}

    // MARK: Methods
    func getUpcomingMovies() {
        
    }
}
