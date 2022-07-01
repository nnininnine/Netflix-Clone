//
//  Constants.swift
//  Netflix-Clone
//
//  Created by Nuttapon Buaban on 1/7/2565 BE.
//

import Foundation

enum ConstantsKeys: String {
    case BASE_URL
    case API_KEY
}

enum Constants {
    static let baseUrl: String = getConstantFromInfo(forKey: ConstantsKeys.BASE_URL.rawValue, type: "") ?? ""
    static let apiKey: String = getConstantFromInfo(forKey: ConstantsKeys.API_KEY.rawValue, type: "") ?? ""
}

private func getConstantFromInfo<T>(forKey key: String, type: T) -> T? {
    guard let result = Bundle.main.infoDictionary?[key] as? T else { return nil }

    return result
}