//
//  SearchService.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 5/7/2565 BE.
//

import Foundation

class SearchService {
    // MARK: Init

    init() {}

    // MARK: Methods

    func getDiscoverMovies(completion: @escaping (Bool, TitleMovies?, String?) -> Void) {
        let url = Constants.baseUrl + "/3/discover/movie?api_key=" + Constants.apiKey + "&sort_by=popularity.desc"
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
