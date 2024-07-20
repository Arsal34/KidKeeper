//
//  AppDelegate.swift
//  KidKeeper
//
//  Created by M1 on 02/06/2024.
//

import Foundation
import UIKit
import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("AppDelegate: didFinishLaunchingWithOptions")
        FirebaseApp.configure()
//        GIDSignIn.sharedInstance.clientID = "808589872220-h8djp9tniotipv3c0d5fppofronk15t4.apps.googleusercontent.com"
        return true
    }
    
    func application(_ application: UIApplication,
                     open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    func application1(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Handle incoming URL here
        if url.scheme == "yourappscheme" {
            // Parse the URL and navigate to the appropriate view
            // Example: If the URL is for password reset, navigate to that screen
        }
        return true
    }
}
