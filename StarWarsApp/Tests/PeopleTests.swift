//
//  PeopleTests.swift
//  StarWarsAppTests
//
//  Created by Emil Vaklinov on 05/02/2021.
//  Copyright © 2021 Emil Vaklinov. All rights reserved.
//

import XCTest
import Moya
import RxSwift
@testable import StarWarsApp

class PeopleTests: XCTestCase {

    var mockPeopleModel: People!
    
    override func setUp() {
        super.setUp()
        let jsonData = ServiceMock.getJsonAsData(filename: "people")
        mockPeopleModel = try? JSONDecoder().decode(People.self, from: jsonData)
    }
    
    func testPeople() {
        let peopleCount = mockPeopleModel.results.count
        XCTAssertTrue(peopleCount == 10, "The mock response count is invalid")
    }
    
    func testFilmIdsForFirstCharacter() {
        let viewModel = PeopleVM()
        viewModel.peopleModel = mockPeopleModel
        let filmIds = viewModel.getFilmIds(for: 0)
        XCTAssertTrue(filmIds.elementsEqual(["1", "2", "3", "6"]), "The film ids were not extracted correctly")
    }

}
