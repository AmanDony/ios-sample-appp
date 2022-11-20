//
//  Result.swift
//  MovieVapp
//
//  Created by Haiyan Ma on 04/12/2017.
//  Copyright © 2022 Aman Sinha. All rights reserved.
//

import Foundation

public enum MovieErrorType: Error {
    case noInternet
}

enum Result<T> {
    case success(T)
    case failure(MovieErrorType)
}
