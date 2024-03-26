//
// MainViewModel.swift
// WongnaiInternAssignment
//
// Created by Warat Poovorakit on 23/3/2567 BE.
//

import Foundation

class MainViewModel {
    // MARK: - Properties
    internal var photos: [Photo] = []
    
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
    func fetchPhotos(page: Int = 1, completion: @escaping (Result<PhotoResponse, Error>) -> Void) {
        APIService.shared.fetchPhotos(page: page) { [weak self] result in
            switch result {
            case .success(let photoResponse):
                self?.photos.append(contentsOf: photoResponse.photos)
                completion(.success(photoResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Clear Photos
    func clearPhotos() {
        photos.removeAll()
    }
}
