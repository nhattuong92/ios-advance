//
//  APIError.swift
//  MovieBox
//
//  Created by Duy Nguyen on 27/8/21.
//  Copyright © 2021 Backbase. All rights reserved.
//

import Foundation
import Alamofire

enum APIError: Error, Equatable {
    case noInternet
    case knownError(code: Int)
    case serialization
    case unknownError
    
    var description: String {
        switch self {
        case .noInternet:
            return "There is no internet connection."
        case .knownError(let code):
            return "Error code \(code)"  // In real project, we will determine error message base on the code.
        case .serialization:
            return "Please try again later."
        case .unknownError:
            return "We are facing difficulty, please try again later."
        }
    }
}

extension AFError {
    func mapToAPIError() -> APIError {
        switch self {
        case .sessionTaskFailed(let error):
            if let error = error as? URLError, error.code == URLError.notConnectedToInternet {
                return .noInternet
            }
            return .unknownError
        case .responseValidationFailed:
            return .knownError(code: 999)
        case .responseSerializationFailed:
            return .serialization
        default:
            return .unknownError
        }
    }
}
