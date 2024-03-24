//
// APIService.swift
// WongnaiInternAssignment
//
// Created by Warat Poovorakit on 22/3/2567 BE.
//

import Foundation

class APIService {
    // MARK: - Singleton
    static let shared = APIService()
    
    private init() {}
    
    // MARK: - Fetch Photos
    func fetchPhotos(page: Int = 1, completion: @escaping (Result<PhotoResponse, NetworkError>) -> Void) {
        guard let url = NetworkService.Endpoint.popularPhotos(page: page).url else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataNotFound))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let photoResponse = try decoder.decode(PhotoResponse.self, from: data)
                completion(.success(photoResponse))
            } catch {
                completion(.failure(.other(error)))
            }
        }.resume()
    }
}
