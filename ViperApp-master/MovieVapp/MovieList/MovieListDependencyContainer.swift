//
//  MovieListDependencyContainer.swift
//  MovieVapp
//
//  Created by Haiyan Ma on 04/12/2017.
//  Copyright © 2022 Aman Sinha. All rights reserved.
//

import UIKit

class ListDependencyContainer {
    lazy var interactor = MovieListInteractor()
    lazy var router = MovieListRouter()
    lazy var presenter = MovieListPresenter(interactor: interactor, router: router)

    func makeMovieListViewController() -> MovieListCollectionViewController {
        let m = MovieListCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        m.presenter = presenter
        // Dependency Inversion
        presenter.movieListViewInterface = m
        interactor.output = presenter
        return m
    }
}
