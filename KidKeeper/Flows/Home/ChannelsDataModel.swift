//
//  ChannelDataModel.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 08/06/2024.
//

import SwiftUI

struct ChannelsData: View{
    @State private var searchText = ""
    @StateObject private var viewModel = ContentViewModel()

    let usernames = ["google", "Apple", "Microsoft", "OpenAI", "TED", "ChuChuTV", "NatGeo"]
    var errorMessage = ""
    var sampleChannels: [Channel] = []
    
    var body: some View {
        VStack {
            List(viewModel.sampleChannels) { channel in
                ChannelRow(channel: channel)
            }
        }
        .onAppear {
            viewModel.fetchSampleChannels(usernames: usernames, completion: { _ in
            })
        }
        .navigationTitle("Channel Details")
               .navigationBarTitleDisplayMode(.inline)
    }
    
    struct ChannelRow: View {
        let channel: Channel // Replace with your Channel model type

        var body: some View {
            HStack(spacing: 16) {
                Image(systemName: "person.crop.circle") // Replace with actual image from channel
                    .resizable()
                    .frame(width: 60, height: 60)
                    .aspectRatio(contentMode: .fill)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(channel.items.first?.snippet.title ?? "")
                        .font(.headline)
                    Text(channel.items.first?.snippet.description ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "math")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(.vertical, 8)
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published var sampleChannels: [Channel] = []

    func fetchSampleChannels(usernames: [String], completion: @escaping ([Channel]?) -> Void) {
        Task.init {
            var sampleChannels: [Channel] = []
            
            for username in usernames {
                do {
                    if let channelID = try await YoutubeUtility.fetchChannelID(forUsername: username) {
                        sampleChannels.append(try await YoutubeUtility.fetchChannelInfo(channelID: channelID))
                    } else {
                        print("Channel ID not found.")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            
            completion(sampleChannels.isEmpty ? nil : sampleChannels)
        }
    }
}


struct ChannelDataPreview: PreviewProvider {
    static var previews: some View {
        ChannelsData()
    }
}

