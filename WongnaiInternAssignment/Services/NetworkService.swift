//
// NetworkService.swift
// WongnaiInternAssignment
//
// Created by Warat Poovorakit on 22/3/2567 BE.
//

import Foundation

struct NetworkService {
    // MARK: - Base URL
    private static let baseURL = "https://api.500px.com/v1/"
    
    // MARK: - Endpoint
    enum Endpoint {
        case popularPhotos(page: Int)
        
        var path: String {
            switch self {
            case .popularPhotos(let page):
                return "photos?feature=popular&page=\(page)"
            }
        }
        
        var url: URL? {
            guard let url = URL(string: NetworkService.baseURL + path) else {
                return nil
            }
            return url
        }
    }
}
