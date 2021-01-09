//
//  ArticleCellViewModelTests.swift
//  NYTimesTaskTests
//
//  Created by AboNabih on 1/8/21.
//

import XCTest
@testable import NYTimesTask


class ArticleCellViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testIfTitleBindedWithValue()
    {
        let article = Article(id: 1, title: "First Article", abstract: "Description")
       let viewModel = ArticleCellViewModel(item: article)
        
       XCTAssertTrue(viewModel.titleTxt.value == article.title)
        
    }

    func testIfDescriptionBindedWithValue()
    {
        let article = Article(id: 1, title: "First Article", abstract: "Description")

        let viewModel = ArticleCellViewModel(item: article)
        
        XCTAssertTrue(viewModel.descriptionTxt.value == article.abstract)
        
    }

}
