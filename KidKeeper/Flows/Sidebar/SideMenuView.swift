//
//  SideMenuView.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 21/03/2024.
//



import SwiftUI
import UIKit
struct SideMenuView: View {
    let option: SideMenuOptionModel
    @Binding var SelectedOption: SideMenuOptionModel?
    private var IsSelected: Bool{
        return SelectedOption == option
    }
    var body: some View {
        HStack{
            Image(option.ImageName)
                .resizable()
                .frame(width: 15, height: 15)
                .padding(.leading,-8)
                .padding(.top,2)
        
            Text(option.title)
                .fontWeight(.regular)
                .foregroundColor(.black)
                
            Spacer()
        }
        .padding(.leading)
        .frame(height: 44)
    }
}

struct SideMenuView_Preview: PreviewProvider {
    static var previews: some View {
        SideMenuView(option: .AddChannel, SelectedOption: .constant(.AddChannel))
    }
}

