import Foundation
import SwiftUI

struct ChildHomeView: View {
    @State private var showmenu = false
    @State private var showPasswordAlert = false
    @EnvironmentObject var authManager: AuthManager
    @State private var ParentMode = false
    @State private var password = ""
    @State private var alertPassword = ""
    @State private var showIncorrectPasswordAlert = false

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            NavigationStack {
                ZStack {
                    VStack {
                        TabView {
                            VideoView()
                                .tabItem {
                                    Image(systemName: "house.fill")
                                    Text("Home")
                                }
                                .tag(0)
                            
                            AddChannelView()
                                .tabItem {
                                    Image(systemName: "tv.fill")
                                    Text("Channels")
                                }
                                .tag(1)
                            
                            Playlists()
                                .tabItem {
                                    Image(systemName: "heart.fill")
                                    Text("Favorites")
                                }
                                .tag(2)
                        }
                        .accentColor(.OnClickColour)
                    }
                }
                Divider()
                    .background(Color.OnClickColour)
                    .navigationBarTitleDisplayMode(.automatic)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack {
                                Text("Child Mode")
                                    .font(.title)
                                    .foregroundColor(.black)
                                Spacer()
                                Button(action: { showPasswordAlert.toggle() }) {
                                    Image("parent")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                }
                                .accentColor(.yellow)
                                .alert("Enter Parent Password", isPresented: $showPasswordAlert, actions: {
                                    SecureField("Password", text: $alertPassword)
                                    Button("Submit", action: {
                                        if validatePassword(alertPassword) {
                                            ParentMode = true
                                            showPasswordAlert = false
                                        } else {
                                            showIncorrectPasswordAlert = true
                                        }
                                    })
                                    Button("Cancel", role: .cancel, action: {
                                        showPasswordAlert = false
                                    })
                                })
                                .alert("Incorrect Password", isPresented: $showIncorrectPasswordAlert, actions: {
                                    Button("OK", action: {})
                                })
                            }
                        }
                    }
            }
        }
    }
    
    private func validatePassword(_ password: String) -> Bool {
        // Replace with your password validation logic
        return password == "your_parent_password"
    }
}

struct ChildHomeView_Preview: PreviewProvider {
    static var previews: some View {
        ChildHomeView()
    }
}
