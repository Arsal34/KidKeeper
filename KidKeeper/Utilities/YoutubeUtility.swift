//
//  FetchYTSDK.swift
//  KidKeeper
//
//  Created by M1 on 29/06/2024.
//

import Foundation
import Alamofire

class YoutubeUtility {
    
    static func fetchChannelID(forUsername username: String) async throws -> String? {
        let apiKey = "AIzaSyD-YdDljp7L3LUA72C3mP-P1IFBfcxoxV0"
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
        let apiKey = "AIzaSyD-YdDljp7L3LUA72C3mP-P1IFBfcxoxV0"
        
        let url = URL(string: "https://www.googleapis.com/youtube/v3/channels?part=snippet,statistics&id=\(channelID)&key=\(apiKey)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        //print("Response JSON: \(String(data: data, encoding: .utf8) ?? "")")
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let response = try decoder.decode(Channel.self, from: data)
        
        return response
    }
}
