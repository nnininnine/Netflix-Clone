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

    func getMovies(url: String, completion: @escaping (Bool, TitleMovies?, String?) -> Void) {
        HttpHelper.shared.get(url) { success, data, err in
            if success {
                do {
                    guard let data = data else {
                        completion(false, nil, err)
                        return
                    }
                    let resp = try JSONDecoder().decode(TitleMoviesResponse.self, from: data)

                    completion(true, resp.results, nil)
                } catch let err {
                    completion(false, nil, err.localizedDescription)
                }
            } else {
                completion(false, nil, err)
            }
        }
    }
}
