//
//  MovieDetailDependencyContainer.swift
//  MovieVapp
//
//  Created Haiyan Ma on 04/12/2017.
//  Copyright © 2022 Aman Sinha. All rights reserved.
//
//  Template generated by Haiyan Ma @swiftTsubame
//

import UIKit

class MovieDetailDependencyContainer {
    lazy var interactor = MovieDetailInteractor()
    lazy var router = MovieDetailRouter()
    lazy var presenter = MovieDetailPresenter(interactor: interactor, router: router)

    func createModule(for movie: Movie) -> UIViewController {
        let view = MovieDetailViewController(nibName: nil, bundle: nil)
        view.presenter = presenter
        interactor.movie = movie
        presenter.viewInterface = view
        return view
    }
}
