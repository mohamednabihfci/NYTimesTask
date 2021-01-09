//
//  ArticlesClientTests.swift
//  NYTimesTaskTests
//
//  Created by AboNabih on 1/8/21.
//

import XCTest
import Moya
import RxBlocking
@testable import NYTimesTask

class ArticlesClientTests: XCTestCase {
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAriclesAPIRequest() {
       
        // given
        let mockArticleObject = PopularArticles(status: "OK", copyright: "Mohamed Nabih", numResults: 1, results: [Article(id: 1, title: "First Article", abstract: "Description")])
        
        let mockArticleData = try! JSONEncoder().encode(mockArticleObject)
        let provider = MoyaProvider<ArticleRouter>(endpointClosure: { self.mockEndpointForAPI(api: $0, response: .networkResponse(200, mockArticleData)) },
                                                stubClosure: { _ in .immediate })
        // When
        let articleAPI = ArticleClient(provider: provider)
        
        guard let popularArticles = try? articleAPI.fetchPopularArticles(period: "1").toBlocking().first() else {
            XCTFail()
            return
        }
        // Then
        XCTAssertEqual(popularArticles.status, "OK")
        XCTAssertGreaterThan(popularArticles.results?.count ?? 0, 0, "Empty result")
        
    }
    
    func mockEndpointForAPI(api: TargetType, response: EndpointSampleResponse) -> Endpoint {
        return Endpoint(url: api.baseURL.absoluteString,
                        sampleResponseClosure: { response },
                        method: api.method,
                        task: api.task,
                        httpHeaderFields: api.headers)
    }
    
}
