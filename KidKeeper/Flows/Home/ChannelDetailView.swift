//
//  ChannelDetailView.swift
//  KidKeeper
//
//  Created by M1 on 20/07/2024.
//

import SwiftUI

struct ChannelDetailView: View {
    let channel: Channel
    @StateObject private var viewModel = VideoViewModel()
    
    init(channel: Channel) {
        self.channel = channel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Image with title and description
            HStack(alignment: .top, spacing: 16) {
                AsyncImage(url: URL(string: channel.items.first?.snippet.thumbnails.high.url ?? "")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(channel.items.first?.snippet.title ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    Text(channel.items.first?.snippet.description ?? "")
                        .font(.body)
                        .foregroundColor(.gray)
                        .lineLimit(nil) // Remove line limit for full description
                }
                .padding(.top, 8) // Adjust top padding for better alignment
            }
            .padding(16)
             
            VideoData(videos: viewModel.video)
            
            Spacer() // Spacer to push content to the top
        }
        .padding(.horizontal, 16)
        .navigationBarTitle(channel.items.first?.snippet.title ?? "", displayMode: .inline) 
        .onAppear {
            viewModel.fetchVideos(channelID: channel.items.first?.id ?? "")
        }
    }
}

struct VideoData: View {
    var videos: [Video]
    var body: some View {
        VStack {
            List(videos) { video in
                NavigationLink(destination: VideoPlayerView(video: video)) {
                    VideoRow(video: video)
                }
            }
        }
    }
}


struct VideoRow: View {
    let video: Video
    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: video.thumbnailURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(video.title ?? "")
                    .font(.headline)
            }
            Image(systemName: "math")
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}

class VideoViewModel: ObservableObject {
    @Published var video: [Video] = []
    
    
    func fetchVideos(channelID: String) {
        Task {
            do {
                if let playlistId = try await YoutubeUtility.fetchUploadsPlaylistId(for: channelID) {
                    self.video = try await YoutubeUtility.fetchVideos(from: playlistId)
                }
            } catch {
                print("Error fetching channels: \(error.localizedDescription)")
            }
        }
    }
    
}

struct ChannelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelDetailView(channel: Channel(
            kind: "123",
            etag: "123",
            pageInfo: PageInfo(totalResults: 1, resultsPerPage: 1),
            items: [Item(kind: "123", etag: "123", id: "Test", snippet:
                            Snippet(
                                title: "Test Channel",
                                description: "This channel is created to test the flow of the application",
                                customURL: "",
                                publishedAt: Date(),
                                thumbnails: Thumbnails(thumbnailsDefault: .init(url: "", width: 1, height: 1), medium: .init(url: "", width: 1, height: 1), high: .init(url: "", width: 1, height: 1)),
                                localized: Localized(title: "", description: "")),
                         statistics: Statistics(
                            viewCount: "123",
                            subscriberCount: "100",
                            hiddenSubscriberCount: false,
                            videoCount: "10")
                        )
            ]
        )
        )
    }
}
