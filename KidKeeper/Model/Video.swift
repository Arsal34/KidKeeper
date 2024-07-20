//
//  Video.swift
//  KidKeeper
//
//  Created by M1 on 20/07/2024.
//
 
import Foundation

struct Video: Identifiable, Decodable {
    let id: String
    let title: String
    let description: String
    let thumbnailURL: URL
    let publishedAt: Date
    let channelTitle: String
    let videoId: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case snippet
    }

    enum SnippetKeys: String, CodingKey {
        case title
        case description
        case thumbnails
        case publishedAt
        case channelTitle
        case resourceId
    }

    enum ThumbnailsKeys: String, CodingKey {
        case high
    }

    enum HighKeys: String, CodingKey {
        case url
    }

    enum ResourceIdKeys: String, CodingKey {
        case videoId
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)

        let snippetContainer = try container.nestedContainer(keyedBy: SnippetKeys.self, forKey: .snippet)
        title = try snippetContainer.decode(String.self, forKey: .title)
        description = try snippetContainer.decode(String.self, forKey: .description)
        publishedAt = try snippetContainer.decode(Date.self, forKey: .publishedAt)
        channelTitle = try snippetContainer.decode(String.self, forKey: .channelTitle)
        
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: ThumbnailsKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: HighKeys.self, forKey: .high)
        thumbnailURL = try highContainer.decode(URL.self, forKey: .url)
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: ResourceIdKeys.self, forKey: .resourceId)
        videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}

