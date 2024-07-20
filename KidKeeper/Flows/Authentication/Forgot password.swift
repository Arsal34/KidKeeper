//
//  Forgot password.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 11/07/2024.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var image = false
    @EnvironmentObject var authManager: AuthManager
    
    
    var body: some View {
        ZStack{
            Image("apple")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack{
                    Button(action: {
                        image = true
                    }) {
                        Image("back")
                            .resizable()
                            .frame(width: 50, height: 50)
                            
                    }
                    Text("Back")
                        .foregroundColor(.white)
                        .font(.headline)
                        .font(.system(size: 50))
                        .padding(.trailing,300)
                }
                .padding(.leading,0)
            Spacer()
                    .padding(.trailing,380)
            .fullScreenCover(isPresented: $image) {
               Login()
            }
            
            }
            Spacer()
            
            
            VStack(alignment: .center, spacing: 20) {
                
                Text("Forgot Password")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    .foregroundColor(.white)
                
                TextField("Enter your email address", text: $email)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)
                    .padding(.bottom,20)
          
                
                Button(action: {
                    sendPasswordReset()
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(AppColor.getColor(.primaryYellow)())
                        .cornerRadius(10)
                       
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Password Reset"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            Spacer()
        }
    }
    func checkEmail() {
           Auth.auth().fetchSignInMethods(forEmail: email) { (methods, error) in
               if let error = error {
                   self.alertMessage = error.localizedDescription
                   self.showingAlert = true
                   return
               }
               
               if let methods = methods, methods.isEmpty {
                   // Email is not registered
                   self.alertMessage = "This email is not registered."
                   self.showingAlert = true
               } else {
                   // Email is registered, proceed with sending reset password email
                   sendPasswordReset()
               }
           }
       }
    
    private func sendPasswordReset() {
        guard !email.isEmpty else {
            alertMessage = "Please enter your email address."
            showingAlert = true
            return
        }
        
       authManager.sendPasswordReset(withEmail: email) { error in
            if let error = error {
                alertMessage = "The email format is not correct"
            }
            else {
                alertMessage = "A password reset link has been sent to \(email)."
            }
            showingAlert = true
        }
    }
}



    
    struct ForgotPasswordView_Previews: PreviewProvider {
        static var previews: some View {
            ForgotPasswordView()
                .environmentObject(AuthManager())
        }
    }

