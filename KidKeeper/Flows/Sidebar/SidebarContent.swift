//
//  SidebarContent.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 21/03/2024.
//

import SwiftUI


struct SidebarContent: View {
    @State private var isShowingSidebar = false

    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    withAnimation {
                        isShowingSidebar.toggle()
                    }
                }) {
                    Text("Toggle Sidebar")
                }
                Spacer()
            }
            
            Sidebar(IsShowing: $isShowingSidebar)
        }
    }
}

struct SidebarContent_preview: PreviewProvider {
    static var previews: some View {
        SidebarContent()
    }
}


/*
struct SidebarContent: View {
    @State private var showmenu = false
    var body: some View {
        
        
        NavigationStack {
            ZStack {
                
            }
            .toolbar(showmenu ? .hidden : .visible, for: .navigationBar)
            Sidebar(IsShowing: $showmenu)
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .automatic){
                        Button(action:{ showmenu.toggle() },label: {Image (systemName: "line.3.horizontal")})
                    }
                }
        }
        
    }
}

struct SidebarContent_Preview: PreviewProvider {
    static var previews: some View {
        SidebarContent()
    }
}
*/
