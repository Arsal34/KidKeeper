import SwiftUI
import Alamofire

struct ChannelInfoTester: View {
    //@State private var channelInfo: String = "Fetching channel info..."
    
    @State private var channel: Channel?
    @State private var errorMessage: String?
    
    var body: some View {
        VStack {
            if let channel = channel {
                HStack {
                    AsyncImage(url: URL(string: channel.items.first?.snippet.thumbnails.high.url ?? "")) { image in
                        image.resizable()
                           // .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .padding(.leading,20)
                           // .padding(.top,10)
                            
                    } placeholder: {
                        Text("Channel")
                    }
                    
                    Text(channel.items.first?.snippet.title ?? "")
                        .font(.subheadline)
                    Spacer()
                }
                VStack{
                    Text(channel.items.first?.snippet.description ?? "")
                        .padding(.leading,30)
                        .padding(.trailing,20)
                   
                    Text("Youtube Subscribers: \(channel.items.first?.statistics.subscriberCount ?? "")")
                        .font(.headline)
                        
                   
                }
            }
            else if let errorMessage = errorMessage {
                Text(errorMessage)
            } else {
                ProgressView("Loading...")
            }
            
            Button(action: {
                Task {
                    await loadChannelInfo(forUsername: "chuchutv")
                }
            }) {
                Text("Fetch Channel Info")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        
    }
    func loadChannelInfo(forUsername username: String) async {
        do {
            if let channelID = try await YoutubeUtility.fetchChannelID(forUsername: username) {
                channel = try await YoutubeUtility.fetchChannelInfo(channelID: channelID)
            } else {
                errorMessage = "Channel ID not found."
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

struct ChannelInfoTesterView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelInfoTester()
    }
}
