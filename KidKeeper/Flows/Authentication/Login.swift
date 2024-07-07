import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedin = false
    @State private var isSignedup = false
    @State private var isSigningIn = false
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        ZStack {
            Image("apple") // Replace "backgroundImage" with your image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                Text("Login")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .padding(.top,30)
                
                Text("Please sign in to continue")
                    .font(.headline)
                    .foregroundColor(Color.gray)
                    .opacity(0.6)
                    .padding(.bottom, 50)
                
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
                    
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
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
                            .padding(.leading,10)
                            .background(Color.clear)
                            .cornerRadius(10)
                    }
                    .padding()
                    .fullScreenCover(isPresented: $isSignedup) {
                        Signup()
                    }
                    
                    
                    //                    .fullScreenCover(isPresented: $isLoggedin) {
                    //Signup()
                    //                    }
                }
                
                Button(action: {
                    //                    isLoggedin = true
                    isSigningIn = true
                    authManager.signInWithEmail(withEmail: email, password: password, completion: { error in
                        handleAuthenticationResult(error)
                        isSigningIn = false
                    })
                }) {
                    if isSigningIn {
                        ProgressView()
                    } else {
                        Text("Sign In")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(AppColor.getColor(.primaryYellow)())                        .cornerRadius(10)
                            .font(.system(size: 20))
                    }
                }
                .fullScreenCover(isPresented: $isLoggedin) {
                    Home()
                }
                
                Spacer()
            }
        }
        
    }
    
    private func handleAuthenticationResult(_ error: Error?) {
        if let error = error {
            // Handle sign-in error
            print("Sign-in error: \(error.localizedDescription)")
        } else {
            print("Signed in successfully!")
        }
        // Show result
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            Login()
        }
    }
}
