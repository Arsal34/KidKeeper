//
//  KidKeeperApp.swift
//  KidKeeper
//
//  Created by M1 on 07/08/2023.
//

import SwiftUI

@main
struct KidKeeperApp: App {
    @StateObject private var authManager = AuthManager()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if authManager.isUserLoggedIn {
                    Home()
                        .environmentObject(authManager)
                } else {
                    Login()
                        .environmentObject(authManager)
                }
            }
        }
    }
}
