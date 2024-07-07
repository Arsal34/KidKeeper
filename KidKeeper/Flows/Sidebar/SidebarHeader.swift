//
//  SidebarHeader.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 21/03/2024.
//

import SwiftUI

struct SidebarHeader: View {
    @Binding var showmenu: Bool
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: { toggleSideBar() }) {
                Image("icons8-less-than-50")
                    .resizable()
                    .frame(width: 17, height: 17)
                    .padding(.top, 20)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Menu")
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
                    .fontWeight(.medium)
            }
            .padding()
        }
    }
    
    private func toggleSideBar() {
        showmenu.toggle()
    }
}

struct SidebarHeader_Previews: PreviewProvider {
    static var previews: some View {
        SidebarHeader(showmenu: .constant(false))
    }
}


//@State private var showmenu =  true
  /*  @State private var image = false
    @Binding var showmenu: Bool
   
    var body: some View {
        
        HStack(alignment: .top){
            Sidebar(IsShowing: $showmenu)
            Button(action:{ showmenu.toggle() },label: {Image("icons8-less-than-50")
                    .resizable()
                    .frame(width: 17, height: 17)
                    .padding(.top,20)
            })
                  
            VStack(alignment: .leading, spacing: 10) {
                Text("Menu")
                
                    .font(.system(size: 20))
                    .foregroundColor(.blue)
                    .fontWeight(.medium)
            }
            .padding()
           
        }
    }
    
}

struct SidebarHeader_Preview: PreviewProvider {
    static var previews: some View {
        Sidebar(IsShowing: .constant(false))
    }
}
*/
