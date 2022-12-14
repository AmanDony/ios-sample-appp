//
//  MovieVappTests.swift
//  MovieVappTests
//
//  Created by Haiyan Ma on 01/12/2017.
//  Copyright © 2022 Aman Sinha. All rights reserved.
//

import XCTest
@testable import MovieVapp

class MovieEntityTests: XCTestCase {

    func testMovieSetGet() {
        let movie = Movie(name: "Interstella", rating: 5, imageName: "avatar")
        XCTAssertEqual(movie.name, "Interstella")
        XCTAssertEqual(movie.rating, 5)
        XCTAssertEqual(movie.imageName, "avatar")
    }
}
