//
//  FetchYTSDK.swift
//  KidKeeper
//
//  Created by M1 on 29/06/2024.
//

import Foundation
import Alamofire

class YoutubeUtility {
    static var apiKey = "AIzaSyD-YdDljp7L3LUA72C3mP-P1IFBfcxoxV0"
    
    static func fetchChannelID(forUsername username: String) async throws -> String? {
        let url = URL(string: "https://www.googleapis.com/youtube/v3/channels?part=id&forHandle=\(username)&key=\(apiKey)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        //print("Response JSON: \(String(data: data, encoding: .utf8) ?? "")")
        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
           let items = json["items"] as? [[String: Any]],
           let item = items.first,
           let channelID = item["id"] as? String {
            return channelID
        } else {
            return nil
        }
    }
    
    static func fetchChannelInfo(channelID: String) async throws -> Channel {
        
        let url = URL(string: "https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&id=\(channelID)&key=\(apiKey)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        //print("Response JSON: \(String(data: data, encoding: .utf8) ?? "")")
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(Channel.self, from: data)
        
        return response
    }
    
    static func fetchUploadsPlaylistId(for channelId: String) async throws -> String? {
        let urlString = "https://www.googleapis.com/youtube/v3/channels?part=contentDetails&id=\(channelId)&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let items = json["items"] as? [[String: Any]],
           let contentDetails = items.first?["contentDetails"] as? [String: Any],
           let relatedPlaylists = contentDetails["relatedPlaylists"] as? [String: Any],
           let uploadsPlaylistId = relatedPlaylists["uploads"] as? String {
            return uploadsPlaylistId
        }
        
        return nil
    }

    static func fetchVideos(from playlistId: String) async throws -> [Video] {
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(playlistId)&maxResults=50&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Data: \(jsonString)")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(PlaylistItemsResponse.self, from: data)
        return response.items
    }
}
