import SwiftUI

struct Home: View {
    @State private var showmenu = false
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            //HStack {
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
                                    Text("Playlists")
                                }
                                .tag(2)
                        }
                        .accentColor(.OnClickColour)
                    }
                    
                    
                    .toolbar(showmenu ? .hidden : .visible, for: .navigationBar)
                    Sidebar(IsShowing: $showmenu)
                }
               Divider()
                    .background(Color.OnClickColour)
                
                .navigationBarTitleDisplayMode(.inline)
                
                .toolbar{
                    ToolbarItem(placement: .navigation){
                        Button(action:{ showmenu.toggle() },label: {Image (systemName: "line.3.horizontal")})
                    }
                }
            }
        }
    }
    
    
    /*Image(systemName: "list.bullet")
     .resizable()
     .frame(width: 30, height: 30)
     .aspectRatio(contentMode: .fill)
     .padding(.leading, 20)
     
     Spacer()
     
     Text("Home")
     .fontWeight(.bold)
     .foregroundColor(.black)
     .font(.system(size: 30))
     
     Spacer()
     }
     .padding(.top, 20)
     */
    
    }
        
    
    
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
