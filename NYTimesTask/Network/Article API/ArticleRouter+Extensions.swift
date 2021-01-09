//
//  ArticleRouter+Extensions.swift
//  NYTimesTask
//
//  Created by AboNabih on 1/7/21.
//

import Moya


extension ArticleRouter: TargetType {
    
    // This is the path of each operation that will be appended to our base URL.
    var path: String {
        switch self {
        case .getPopularArticles(let period):
            return "mostpopular/v2/viewed/\(period).json"
        }
    }
    
    // Here we specify which method our calls should use.
    var method: Method {
        switch self {
        case .getPopularArticles:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPopularArticles:
            let p = ["api-key" : Constants.APIS.API_KEY]
            return .requestParameters(parameters:p , encoding: URLEncoding.default)
        }
    }
    
    // These are the headers that our service requires.
    var headers: [String : String]? { nil }
    
    var sampleData: Data { Data() }
    
    var validationType: ValidationType { .successAndRedirectCodes }
}
