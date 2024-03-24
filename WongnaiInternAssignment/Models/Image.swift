//
// Image.swift
// WongnaiInternAssignment
//
// Created by Warat Poovorakit on 22/3/2567 BE.
//

import Foundation

// MARK: - PhotoResponse
struct PhotoResponse: Codable {
    let currentPage: Int
    let totalPages: Int
    let totalItems: Int
    let photos: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case totalPages = "total_pages"
        case totalItems = "total_items"
        case photos
    }
}

// MARK: - Photo
struct Photo: Codable {
    let id: Int
    let name: String
    let description: String
    let images: [PhotoImage]
    let votesCount: Int
    let user: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case images
        case votesCount = "positive_votes_count"
        case user
    }
}

// MARK: - PhotoImage
struct PhotoImage: Codable {
    let url: String
    let httpsUrl: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case httpsUrl = "https_url"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let username: String
    let fullname: String
}
