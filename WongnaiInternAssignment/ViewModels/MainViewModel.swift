//
// MainViewModel.swift
// WongnaiInternAssignment
//
// Created by Warat Poovorakit on 23/3/2567 BE.
//

import Foundation

class MainViewModel {
    // MARK: - Properties
    private var photos: [Photo] = []
    
    // MARK: - Computed Properties
    var numberOfPhotos: Int {
        return photos.count
    }
    
    // MARK: - Photo Access
    func photo(at index: Int) -> Photo? {
        guard index >= 0 && index < photos.count else {
            return nil
        }
        return photos[index]
    }
    
    // MARK: - Fetch Photos
    func fetchPhotos(completion: @escaping (Result<Void, Error>) -> Void) {
        APIService.shared.fetchPhotos { [weak self] result in
            switch result {
            case .success(let photoResponse):
                self?.photos = photoResponse.photos
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
