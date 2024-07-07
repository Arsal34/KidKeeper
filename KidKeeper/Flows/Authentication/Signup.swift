//
//  Signup.swift
//  KidKeeper
//
//  Created by M1 on 07/08/2023.
//

import SwiftUI

struct Signup: View {
    @State private var Fullname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var Confirmpassword: String = ""
    @State private var isSigningUp = false
    @State private var isLoading = false
    @State private var isSignUpCompleted = false
    @EnvironmentObject var authManager: AuthManager
    
    
    var body: some View {
        ZStack {
            Image("apple") // Replace "backgroundImage" with your image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                Text("Sign up")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .padding(.top,30)
                
                
                VStack(alignment: .leading) {
                    Text("Full Name")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                    
                    TextField("Enter your name", text: $Fullname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal,40)
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                    
                    TextField("Enter your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal,40)
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                    
                    SecureField("Enter your password", text: $password)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal,40)
                
                VStack(alignment: .leading) {
                    Text("Confirm Password")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                    
                    SecureField("Re-enter your Password", text: $Confirmpassword)
                    
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                .padding(.horizontal,40)
                
                Button(action: {
                    isSigningUp = true
                    authManager.createAccount(withEmail: email, password: password, completion: { error in
                        handleAuthenticationResult(error)
                        isSigningUp = false
                    })
                }) {
                    if isSigningUp {
                        ProgressView()
                    } else {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .padding()
                            .background(AppColor.getColor(.primaryYellow)())
                            .cornerRadius(10)
                    }
                }
                .padding(.top)
//                .fullScreenCover(isPresented: isSigningUp) {
//                    Login()
//                }
                Spacer()
            }
            
        }
    }
    
    private func handleAuthenticationResult(_ error: Error?) {
        if let error = error {
            print("Sign-up error: \(error.localizedDescription)")
            // Show error
        } else {
            print("Signed up successfully!")
        }
        // Show result
    }
}
struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup()
    }
}
