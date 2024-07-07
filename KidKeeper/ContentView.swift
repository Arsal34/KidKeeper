//
//  ContentView.swift
//  KidKeeper
//
//  Created by M1 on 07/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Login()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
        
    }
}
//@Binding var IsShowing: Bool
/*struct SidebarPreview: PreviewProvider {
    static var previews: some View {
        Sidebar(IsShowing: .constant(false))    }
}*/
   
    /*struct Sidebar: View {
     @Binding var IsShowing: Bool
     var body: some View {
     ZStack{
     if IsShowing{
     Rectangle().opacity(0.3)
     .ignoresSafeArea()
     .onTapGesture {
     IsShowing.toggle()
     }
     HStack
     {
     VStack(alignment: .leading, spacing: 32) {
     SidebarHeader()
     }
     }
     }
     }
     
     }
     }
     }
     
     */

  
