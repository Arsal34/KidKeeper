//
//  AddNewChannels.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 03/06/2024.
//

import Foundation
import SwiftUI

struct AddNewChannels: View {
    @State private var searchText = ""
    @State private var ChannelName = ""
    @State private var image = false
    @State private var isNavigating = false
    @State private var channel: Channel?
    @State private var msg1 = "Channels are loading..."
    @StateObject private var viewModel = ChannelViewModel()
    
    let usernames = ["pinkfong", "officialalphablocks", "rocknlearn", "BabyEinstein", "TED-Ed","CoComelon", "msrachel","ChuChuTV", "natgeokids","FizzyFunHouse","ABCmouse", "thebrainscoop", "HomeschoolPop","klt","FreeSchool"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    
                    Button(action: {
                        image = true
                    }) {
                        Image("icons8-less-than-50")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .padding(.leading, 8)
                    }
                    .fullScreenCover(isPresented: $image) {
                        Home()
                    }
                    
                    Text("Add Channels")
                        .font(.system(size: 25))
                        .foregroundColor(.yellow)
                        .padding(.top, 2)
                    Spacer()
                }
                
                Rectangle()
                    .frame(height: 0.3)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
                
                // SearchBar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray.opacity(1))
                        .padding(.leading)
                    
                    TextField("Search", text: $searchText)
                        .padding(.vertical, 10)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal, 25)
                
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                    .padding(.top, 15)
                
                Text("Tap any channel to view its details. Channels are collections of many videos from a single creator.")
                    .padding(.horizontal, 40)
                    .font(.system(size: 15))
                    .font(.custom("ZenLoop-Regular", size: 15))
                    .padding(.top, 10)
                
                ZStack {
                    TextField("@ChuChu Tv", text: $ChannelName)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.yellow)
                        )
                        .frame(width: 150, height: 40)
                        .padding(.trailing, 150)
                        .font(.system(size: 15))
                    
                    Button(action: {
                        // Action for adding channels
                    }) {
                        Text("Add Channels")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .frame(width: 150, height: 40)
                            .background(Color.yellow)
                            .cornerRadius(20)
                            .font(.system(size: 15))
                    }
                    .padding(.leading, 200)
                    Spacer()
                }
                
                
                if !filteredItems.isEmpty {
                    ChannelsData(sampleChannels: filteredItems)
                } else {
                    Button ( action: {
                        showMessageWithDelay()
                    })
                    {
                        Text("Channel not found ☹️")
                            .padding(.top,50)
                            .padding(.leading,115)
                            .font(.subheadline)
                    }
                }
                Spacer()
            }
            .onAppear {
                viewModel.fetchSampleChannels(usernames: usernames)
            }
        }
    }
    
    var filteredItems: [Channel] {
        if searchText.isEmpty {
            return viewModel.sampleChannels
        } else {
            return viewModel.sampleChannels.filter {
                let title = $0.items.first?.snippet.title ?? ""
                return title.lowercased().hasPrefix(searchText.lowercased())
            }
        }
    }
    func showMessageWithDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            msg1 = "Channels are loading..."
        }
    }
    struct ChannelsData: View {
        @State private var searchText = ""
        var sampleChannels: [Channel]
        
        var body: some View {
                VStack {
                    List(sampleChannels) { channel in
                        NavigationLink(destination: ChannelDetailView(channel: channel)) {
                            ChannelRow(channel: channel)
                        }
                    }
                }
        }
    }
    
    struct ChannelRow: View {
        let channel: Channel
        var body: some View {
            HStack(spacing: 16) {
                AsyncImage(url: URL(string: channel.items.first?.snippet.thumbnails.high.url ?? "")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                } placeholder: {
                    ProgressView()
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(channel.items.first?.snippet.title ?? "")
                        .font(.headline)
                }
                Image(systemName: "math")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(.vertical, 8)
        }
    }
    
    class ChannelViewModel: ObservableObject {
        @Published var sampleChannels: [Channel] = []
        
        func fetchSampleChannels(usernames: [String]) {
            Task {
                do {
                    for username in usernames {
                        if let channelID = try await YoutubeUtility.fetchChannelID(forUsername: username) {
                            self.sampleChannels.append(try await YoutubeUtility.fetchChannelInfo(channelID: channelID))
                        }
                    }
                } catch {
                    print("Error fetching channels: \(error.localizedDescription)")
                }
            }
        }
        
    }
}



struct AddNewChannels_Previews: PreviewProvider {
    static var previews: some View {
        AddNewChannels()
    }
}

