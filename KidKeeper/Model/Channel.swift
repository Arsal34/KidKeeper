//
//  Channel.swift
//  KidKeeper
//
//  Created by M1 on 29/06/2024.
//

import Foundation

// MARK: - Channel
struct Channel: Codable, Identifiable {
    let id = UUID()
    let kind, etag: String
    let pageInfo: PageInfo
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind, etag, id: String
    let snippet: Snippet
    let statistics: Statistics
}

// MARK: - Snippet
struct Snippet: Codable {
    let title, description, customURL: String
    let publishedAt: Date
    let thumbnails: Thumbnails
    let localized: Localized

    enum CodingKeys: String, CodingKey {
        case title, description
        case customURL = "customUrl"
        case publishedAt, thumbnails, localized
    }
}

// MARK: - Localized
struct Localized: Codable {
    let title, description: String
}

// MARK: - Thumbnails
struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: Default

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high
    }
}

// MARK: - Default
struct Default: Codable {
    let url: String
    let width, height: Int
}

// MARK: - Statistics
struct Statistics: Codable {
    let viewCount, subscriberCount: String
    let hiddenSubscriberCount: Bool
    let videoCount: String
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}
