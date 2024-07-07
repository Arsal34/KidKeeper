//
//  Playlists.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 03/06/2024.
//

import Foundation
import SwiftUI
struct Playlists: View
{
    @State private var searchText = ""
    @State private var image = false
    var body: some View {
        ZStack{
           
            VStack{
           /* VStack(alignment: .center, spacing: 10) {
                SearchBar(text: $searchText)
                .padding(.horizontal)
                */
                Spacer()
                Image("pikachu4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 500)
                    .offset(x: 0, y: 40)
                    .padding(.top,80)
                    
                    Text("Tap the plus icon to start adding your children's favorite playlist.")
                        .font(.system(size: 15))
                        
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 40)
                        .lineLimit(2)
                        .padding(.bottom,20)
                    
                
                
                
                Button(action: {
                    image = true
                }) {
                    Text("+ Add your child's favourite playlist")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .font(.system(size: 15))
                    
                }
                .fullScreenCover(isPresented: $image) {
                    AddNewChannels()
                }
               
                
                Spacer()
                    .padding(.bottom,100)
            }
            
        }
        
    }
        
}
struct Playlists_Previews: PreviewProvider {
    static var previews: some View {
        Playlists()
    }
}
