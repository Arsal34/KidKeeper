//
//  Reset password.swift
//  KidKeeper
//
//  Created by Izzat Zaidi on 11/07/2024.
//

/*import Foundation
import SwiftUI
struct ResetPassword: View{
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showPassword: Bool = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("apple")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
         
                VStack(alignment: .center, spacing: 20) {
                    PasswordField(title: "New Password", password: $newPassword, isSecure: $showPassword)
                        .foregroundColor(.white)
                        .font(.subheadline)
                    PasswordField(title: "Confirm Password", password: $confirmPassword, isSecure: $showPassword)
                        .foregroundColor(.white)
                        .font(.subheadline)
                }
                .padding(.horizontal, 40)
                
                Button(action: {
                    // Implement password reset logic here
                    resetPassword()
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .padding(.top,350)
                }
             
            }
            .navigationTitle("Reset Password")
           
        }
      
    }
    private func resetPassword() {
        // Implement your password reset logic here
        // Example: Validate passwords and perform reset action
        
        if newPassword.isEmpty || confirmPassword.isEmpty {
            // Handle empty fields
            print("Please enter both passwords.")
        } else if newPassword != confirmPassword {
            // Handle mismatched passwords
            print("Passwords do not match.")
        } else {
            // Password reset logic
            print("Password reset successful.")
            // You would typically call your backend or Firebase Auth here
        }
    }
    
    struct PasswordField: View {
        var title: String
        @Binding var password: String
        @Binding var isSecure: Bool
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                HStack {
                    if isSecure {
                        SecureField("Enter \(title)", text: $password)
                            
                    } else {
                        TextField("Enter \(title)", text: $password)
                            .foregroundColor(.white)
                    }
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
            }
        }
    }
}
struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
*/
