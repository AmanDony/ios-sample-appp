//
//  MovieDetailPresenterTests.swift
//  MovieVappTests
//
//  Created by Haiyan Ma on 04/12/2017.
//  Copyright © 2022 Aman Sinha. All rights reserved.
//

import XCTest
@testable import MovieVapp



class MovieDetailPresenterTests: XCTestCase {

    var movieDetailPresenter: MovieDetailPresenter!

    class MockInteractor: MovieDetailInteraction {
        var movies: [Movie]? {
            didSet {
                toggleFavoriteCalled = true
            }
        }
        var movie: Movie?
        var toggleFavoriteCalled = false
    }
    
    class MockRouter: MovieDetailRouting {
        
    }
    
    class MockInterface: MovieDetailViewInterface {
        var presenter: MovieDetailPresentation?
        
        var shouldShowNoMovieError = false
        var shouldShowMovieDetail = false

        func showNoMovieError() {
            shouldShowNoMovieError = true
        }
        
        func showMovieDetail(movie: Movie) {
            shouldShowMovieDetail = true
        }
    }

    var mockInteractor: MockInteractor!
    var mockRouter: MockRouter!
    var mockInterface: MockInterface!

    override func setUp() {
        super.setUp()
        mockInteractor = MockInteractor()
        mockRouter = MockRouter()
        mockInterface = MockInterface()
        movieDetailPresenter = MovieDetailPresenter(interactor: mockInteractor, router: mockRouter)
        movieDetailPresenter.viewInterface = mockInterface
    }
    
    override func tearDown() {
        mockInterface = MockInterface()
        super.tearDown()
    }
    
    func testViewInterfaceShowErrorWhenNoMovie() {
        mockInteractor.movie = nil
        movieDetailPresenter.prepareToShowMovieDetail()
        XCTAssertEqual(mockInterface.shouldShowNoMovieError, true)
        XCTAssertEqual(mockInterface.shouldShowMovieDetail, false)
    }
    
    func testViewInterfaceShowMovieWhenSuccess() {
        mockInteractor.movie = Movie(name: "abc", rating: 4, imageName: "avatar")
        movieDetailPresenter.prepareToShowMovieDetail()
        XCTAssertEqual(mockInterface.shouldShowNoMovieError, false)
        XCTAssertEqual(mockInterface.shouldShowMovieDetail, true)
    }
    
    func testToggleFavoriteWillTriggerInteractorToggleCall() {
        XCTAssertEqual(mockInteractor.toggleFavoriteCalled, false)
        mockInteractor.movie = Movie(name: "abc", rating: 4, isFavorite: true, imageName: "avatar")
        movieDetailPresenter.toggleFavorite()
        XCTAssertEqual(mockInteractor.movie?.isFavorite, false)
    }
    
    func testIsFavoriteValueAgreesWithInteractorMovieValue() {
        mockInteractor.movie = Movie(name: "abc", rating: 4, imageName: "avatar")
        XCTAssertEqual(movieDetailPresenter.isFavorite, false)
        
        mockInteractor.movie = Movie(name: "abc", rating: 4, isFavorite: true, imageName: "avatar")
        XCTAssertEqual(movieDetailPresenter.isFavorite, true)
    }
}

