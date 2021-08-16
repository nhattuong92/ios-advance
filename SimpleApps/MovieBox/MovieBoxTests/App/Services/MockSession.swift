//
//  MockSession.swift
//  MovieBoxTests
//
//  Created by Thomas Ngo on 28/7/21.
//  Copyright © 2021 Thomas Ngo. All rights reserved.
//

import Alamofire

final class MockSession: Session {
    var cachedURL: URL?
    var cachedParameters: Parameters?
    
    override func request(_ convertible: URLConvertible, method: HTTPMethod = .get,
                          parameters: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default,
                          headers: HTTPHeaders? = nil, interceptor: RequestInterceptor? = nil,
                          requestModifier: Session.RequestModifier? = nil) -> DataRequest {
        cachedURL = try? convertible.asURL()
        cachedParameters = parameters
        return super.request(convertible, method: method,
                             parameters: parameters, encoding: encoding,
                             headers: headers, interceptor: interceptor,
                             requestModifier: requestModifier)
    }
}
