//
//  VideoPlayView.swift
//  KidKeeper
//
//  Created by M1 on 20/07/2024.
//

import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.scrollView.isScrollEnabled = false
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let htmlString = """
        <!DOCTYPE html>
        <html>
        <body style="margin: 0; padding: 0;">
        <iframe id="ytplayer" type="text/html" width="100%" height="100%"
        src="https://www.youtube.com/embed/\(videoID)?autoplay=1&playsinline=1"
        frameborder="0" allowfullscreen>
        style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
        </iframe>
        </body>
        </html>
        """
        uiView.loadHTMLString(htmlString, baseURL: nil)
    }
}

struct VideoPlayerView: View {
    let video: Video

    var body: some View {
        VStack {
            YouTubePlayerView(videoID: video.videoId ?? "")
                .frame(height: 300) // Adjust the height as needed
                .cornerRadius(10)
                .shadow(radius: 5)

            Text(video.title)
                .font(.title)
                .padding()

            Text(video.description)
                .font(.body)
                .padding()
        }
        .navigationTitle(video.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}


//struct VideoPlayerView: View {
//    let video: Video
//
//    init(video: Video) {
//        self.video = video
//    }
//
//    var body: some View {
//        VStack {
//            Text(video.title ?? "")
//                .font(.title)
//                .padding()
//
//            WebView(url: videoUrl)
//                .frame(height: 300)
//
//            Text(video.description ?? "")
//                .padding()
//
//            Spacer()
//        }
//        .navigationBarTitle("Video Player", displayMode: .inline)
//    }
//
//    private var videoUrl: URL {
//        let videoId = video.videoId ?? ""
//        return URL(string: "https://www.youtube.com/watch?v=\(videoId)")!
//    }
//}
//
