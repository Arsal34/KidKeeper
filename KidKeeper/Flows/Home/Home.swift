import SwiftUI

struct Home: View {
    @State private var showmenu = false
    @EnvironmentObject var authManager: AuthManager
    @State private var ChildMode = false
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
                                    Text("favorites")
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
                
                    .navigationBarTitleDisplayMode(.automatic)
                
                    .toolbar{
                        ToolbarItem(placement: .principal){
                            HStack{
                                
                                Button(action:{ showmenu.toggle() },label: {Image (systemName: "line.3.horizontal")
                                    .frame(width: 30, height: 30)})
                                    

                                Text("Parent Mode")
                                    .font(.title)
                                    .foregroundColor(.lightblue)
                                    .padding(.bottom,3)
                                Button(action:{ ChildMode.toggle() },label: {Image ("yellow child")
                                        .resizable()
                                    .frame(width: 30, height: 30)})
                                    .padding(.leading,100)
                                    .accentColor(.yellows)
                                    .fullScreenCover(isPresented:   $ChildMode)
                                {
                                    ChildHomeView()
                                }
                               
                        }
                    }
                }
            }
        }
    }
}
    
    
    
    struct LoginView_Previews1: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }

