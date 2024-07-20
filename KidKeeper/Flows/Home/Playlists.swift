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
                Spacer()
                Spacer()
                Image("pikachug")
                    
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 500, height: 400)
                    .offset(x: 0, y: 40)
                    .padding(.top,90)
                
                    Spacer()
                    Text("Tap the plus icon to start adding your children's favorite playlist.")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 40)
                    .lineLimit(2)
                    //.padding(.bottom,10)
                    .padding(.top,90)
                    
                Button(action: {
                    image = true
                }) {
                    Text("+ Add your child's favourite videos")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .font(.system(size: 15))
                        .padding(.bottom,50)
                }
                .padding(.top,20)
                .padding(.bottom,30)
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
