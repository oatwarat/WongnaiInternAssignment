//
//  NetworkError.swift
//  WongnaiInternAssignment
//
//  Created by Warat Poovorakit on 23/3/2567 BE.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case dataNotFound
    case other(Error)
}
