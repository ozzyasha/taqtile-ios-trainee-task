//
//  APIError.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 26.07.24.
//

import Foundation

enum APIError: Error {
    case urlError(String)
    case requestError(String)
    case responseError(String)
    case decodeError(String)
}
