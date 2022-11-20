//
//  MovieEndPoints.swift
//  MovieVapp
//
//  Created by Haiyan Ma on 04/12/2017.
//  Copyright © 2022 Aman Sinha. All rights reserved.
//

import Foundation

struct APIBuilder {
    static let ApiScheme = "https"
    static let ApiHost = "s3.amazonaws.com"
    static let ApiPath = "/myMovieViperApp"
}

enum Endpoint: String {
    case movieList, favoriteMovies
}

enum SortType {
    case name, rating, favorite
}

