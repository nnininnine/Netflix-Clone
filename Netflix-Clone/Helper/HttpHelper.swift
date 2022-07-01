//
//  HttpHelper.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 1/7/2565 BE.
//

import Alamofire
import Foundation

class HttpHelper {
    // singleton http client

    // MARK: Property

    static let shared: HttpHelper = {
        let instance = HttpHelper()

        return instance
    }()

    // MARK: Init

    private init() {}

    // MARK: Methods

    func get(_ url: String, completion: @escaping (Bool, Data?, String?) -> Void) {
        guard let url = URL(string: url) else {
            completion(false, nil, "Declare URL failed")
            return
        }
        AF.request(url, method: .get).responseData { resp in
            guard let response = resp.response else {
                completion(false, nil, "Declare response object failed")
                return
            }
            switch resp.result {
            case .success(let data):
                if (200 ..< 300) ~= response.statusCode {
                    // success
                    completion(true, data, nil)
                } else {
                    // http error
                    completion(false, nil, "HTTP error code: \(response.statusCode)")
                }
            case .failure(let err):
                completion(false, nil, err.errorDescription)
            }
        }
    }
}
