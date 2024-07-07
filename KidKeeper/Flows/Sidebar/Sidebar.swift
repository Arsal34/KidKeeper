//
//  Sidebar.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 21/03/2024.
//

import SwiftUI
struct Sidebar: View {
    @State private var image = false
    @Binding var IsShowing: Bool
    @State private var SelectedOption: SideMenuOptionModel?
    
    var body: some View {
        ZStack {
            if IsShowing {
                Rectangle().opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { IsShowing.toggle() }
                
                HStack {
                    VStack(alignment: .leading, spacing: 33) {
                        SidebarHeader(showmenu: $IsShowing)
                        VStack {
                            ForEach(SideMenuOptionModel.allCases) { option in
                                Button(action: {
                                    
                                    handleSelection(option)
                                }) {
                                    SideMenuView(option: option, SelectedOption: $SelectedOption)
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: 220, alignment: .leading)
                    .background(Color.white)
                    Spacer()
                }
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut (duration: 0.5), value: IsShowing)
    }
    
    
    

    private func handleSelection(_ option: SideMenuOptionModel) {
        SelectedOption = option
        print("Selected option: \(option)")
        switch option {
        case .AddChannel:
            addChannelAction()
        case .RemoveChannel:
            removeChannelAction()
        // Add cases for other options if needed
        case .Logout:
            AuthManager.signOut(completion: { error in
                if let error {
                    print("Logout Error!")
                } else {
                    Login()
                }
            })
        default:
            break
        }
    }

    private func addChannelAction() {
            AddNewChannels()
    }

    private func removeChannelAction() {
        print("Remove Channels selected")
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(IsShowing: .constant(true))
    }
}

/*struct Sidebar: View {
    @Binding var IsShowing: Bool
    @State private var SelectedOption: SideMenuOptionModel?
    var body: some View {
        
        ZStack{
            if IsShowing{
                Rectangle().opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {IsShowing.toggle()}
                HStack{
                    
                    VStack(alignment: .leading, spacing:33) {
                        SidebarHeader(showmenu: $IsShowing)
                        VStack{
                            ForEach(SideMenuOptionModel.allCases){option in
                                Button(action: {
                                    print("Button pressed for option: \(option)")

                                    handleSelection(option) }) {
                                    SideMenuView(option: option, SelectedOption: $SelectedOption)}
                                
                            }
                        }
                        Spacer()
                        
                    }
                    .padding()
                    .frame(width: 220, alignment: .leading)
                    .background(.white)
                    Spacer()
                }
                
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: IsShowing)
        
    }
    private func handleSelection(_ option: SideMenuOptionModel) {
        SelectedOption = option
        print("Selected option: \(option)")

        switch option {
        case .AddChannel:
            addChannelAction()
        case .RemoveChannel:
            removeChannelAction()
            // Add cases for other options if needed
        default:
            break
        }
    }
    
    private func addChannelAction() {
        // Handle "Add Channels" action here
        print("Add Channels selected")
    }
    
    private func removeChannelAction() {
        // Handle "Remove Channels" action here
        print("Remove Channels selected")
    }
}

        struct Sidebar_Preview: PreviewProvider {
            static var previews: some View {
                Sidebar(IsShowing: .constant(true))
            }
        }
    
*/
