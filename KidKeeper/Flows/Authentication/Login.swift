import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedin = false
    @State private var isSignedup = false
    @State private var isSigningIn = false
    @State private var alertmsg = false
    @State private var forgotpassword = false
    @State private var emailErrorMessage: String = ""
    @State private var passwordErrorMessage: String = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @EnvironmentObject var authManager: AuthManager
    
    
    
    var body: some View {
        ZStack {
            Spacer()
            Image("apple")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                Text("Login")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .padding(.top,80)
                
                Text("Please sign in to continue")
                    .font(.headline)
                    .foregroundColor(Color.darkgray)
                    .opacity(0.6)
                    .padding(.bottom, 15)
                Spacer()
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                    
                    TextField("Enter your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal, 40)
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        forgotpassword.toggle()
                    }) {
                        Text("Forgot Password")
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.leading,23)
                            .background(Color.clear)
                            .cornerRadius(10)
                            .padding(.top,-20)
                    }
                    .padding()
                    .fullScreenCover(isPresented: $forgotpassword) {
                        ForgotPasswordView()
                    }
                    .padding(.leading,160)
                }
                .padding(.horizontal, 40)
                
                HStack(spacing: 5) {
                    Text("Haven't signed up?")
                        .font(.body)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.leading,30)
                    
                    Button(action: {
                        isSignedup.toggle()
                    }) {
                        Text("Click here")
                            .fontWeight(.medium)
                            .foregroundColor(.red)
                        
                            .background(Color.clear)
                            .cornerRadius(10)
                    }
                    .padding()
                    .fullScreenCover(isPresented: $isSignedup) {
                        Signup()
                    }
                }
                
                Button(action: {
                    //                    isLoggedin = true
                    isSigningIn = true
                    validateFields()
                    if emailErrorMessage.isEmpty && passwordErrorMessage.isEmpty { authManager.signInWithEmail(withEmail: email, password: password)
                        { error in
                            guard let error else { return }
                            handleAuthenticationResult(error)
                            isSigningIn = false
                            showAlert = true
                            alertMessage = error.localizedDescription 
                        }
                    }
                    else {
                        isSigningIn = false
                    }
                }) {
                    if isSigningIn
                    {
                        ProgressView()
                    }
                    else {
                        Text("Sign In")
                            .fontWeight(.bold)
                            .frame(width: 80,height: 20)
                            .foregroundColor(.white)
                            .padding()
                            .background(AppColor.getColor(.primaryYellow)())
                            .cornerRadius(10)
                            .font(.system(size: 20))
                    }
                    
                }
                .alert(isPresented: $showAlert) {
                            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
                Spacer()
                    .fullScreenCover(isPresented: $isLoggedin) {
                        Home()
                    }
                
            }
        }
        
    }
    private func validateFields() {
        if email.isEmpty {
            emailErrorMessage = "Please enter your email."
        } else if !isValidEmail(email) {
            emailErrorMessage = "Please enter a valid email."
        } else {
            emailErrorMessage = ""
        }
        
        if password.isEmpty {
            passwordErrorMessage = "Please enter your password."
        } else {
            passwordErrorMessage = ""
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        // Simple email validation for demonstration
        return email.contains("@") && email.contains(".")
    }
}
func handleAuthenticationResult(_ error: Error?) {
    if let error = error {
        // Handle sign-in error
        print("Sign-in error: \(error.localizedDescription)")
    }
    else {
        print("Signed in successfully!")
    }
    
}
/*private func validateFields(){
 if email.isEmpty {
 emailErrorMessage = "Please enter your email."
 } else if !isValidEmail(email) {
 emailErrorMessage = "Please enter a valid email."
 } else {
 emailErrorMessage = ""
 }
 }*/

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

