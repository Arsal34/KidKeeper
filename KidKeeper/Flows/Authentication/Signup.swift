import SwiftUI

struct Signup: View {
    @State private var Fullname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var Confirmpassword: String = ""
    @State private var isSigningUp = false
    @State private var isLoading = false
    @State private var isLoggedIn = false
    @State private var isSignUpCompleted = false
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @State private var nameErrorMessage = ""
    @State private var emailErrorMessage = ""
    @State private var passwordErrorMessage = ""
    @State private var confirmPasswordErrorMessage = ""
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
                        .disableAutocorrection(true)
                        .onChange(of: Fullname)
                    { newValue in
                        Fullname = newValue.filter { $0.isLetter || $0.isWhitespace }
                                    }
                    .fontWeight(.light)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    if !nameErrorMessage.isEmpty {
                        Text(nameErrorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
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
                        .fontWeight(.light)
                        .autocapitalization(.none)
                    if !emailErrorMessage.isEmpty {
                        Text(emailErrorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                .padding(.horizontal,40)
                
                VStack(alignment: .leading) {
                    
                    Text("Password")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                    
                    HStack{
                        if showPassword {
                            TextField("Enter your password", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        else {
                            SecureField("Enter your password", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showConfirmPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.white)
                        }
                     
                    }
                   
                    
                    if !passwordErrorMessage.isEmpty {
                        Text(passwordErrorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    
                }
                .padding(.horizontal,40)
                
                VStack(alignment: .leading) {
                    Text("Confirm Password")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                    
                    HStack {
                        if showConfirmPassword {
                            TextField("Re-enter your password", text: $Confirmpassword)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.none)
                        } else {
                            SecureField("Re-enter your password", text: $Confirmpassword)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.none)
                        }
                        
                        Button(action: {
                            showConfirmPassword.toggle()
                        }) {
                            Image(systemName: showConfirmPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.white)
                             
                        }
                    }
                    
                    if !confirmPasswordErrorMessage.isEmpty {
                        Text(confirmPasswordErrorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                .padding(.horizontal,40)
                
                Button(action: {
                    validateFields()
                    if nameErrorMessage.isEmpty && emailErrorMessage.isEmpty && passwordErrorMessage.isEmpty && confirmPasswordErrorMessage.isEmpty {
                        isSigningUp = true
                        authManager.createAccount(withEmail: email, password: password, completion: { error in
                            handleAuthenticationResult(error)
                            isSigningUp = false
                        })
                    }
                }) {
                    if isSigningUp {
                        ProgressView()
                    } else {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .frame(width: 80, height: 20)
                            .padding()
                            .fontWeight(.heavy)
                            .background(AppColor.getColor(.primaryYellow)())
                            .cornerRadius(10)
                            .fullScreenCover(isPresented: $isLoggedIn) {
                                Login()
                            }
                        
                    }
                }
                HStack(spacing: 5) {
                    Text("Already have an account?")
                        .font(.body)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.leading,25)
                    Button(action: {
                        isLoggedIn.toggle()
                    }) {
                        Text("Login")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .background(Color.clear)
                            .cornerRadius(10)
                    }
                }
                Spacer()
                    .padding()
                    .fullScreenCover(isPresented: $isLoggedIn) {
                        Login()
                    }
                
            }
            .padding(.top)
            .fullScreenCover(isPresented: $isSignUpCompleted) {
                Login()
            }
            Spacer()
        }
    }
    
    private func validateFields() {
        if Fullname.isEmpty {
            nameErrorMessage = "Please enter your name."
                
        }
        
        else {
            nameErrorMessage = ""
        }
        
        if email.isEmpty {
            emailErrorMessage = "Please enter your email."
        } else if !isValidEmail(email) {
            emailErrorMessage = "Please enter a valid email."
        } else {
            emailErrorMessage = ""
        }
        
        if password.isEmpty {
            passwordErrorMessage = "Please enter your password."
        } else if password.count < 6 {
            passwordErrorMessage = "Password must be at least 6 characters."
        } 
        else if !checkPassword(){
            passwordErrorMessage = "Password should contain special character"
        }
        else {
            passwordErrorMessage = ""
        }
        
        if Confirmpassword.isEmpty {
            confirmPasswordErrorMessage = "Please confirm your password."
        } else if Confirmpassword != password {
            confirmPasswordErrorMessage = "Passwords do not match."
        } else {
            confirmPasswordErrorMessage = ""
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailFormat = "^[0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[a-z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)
    }
    
    private func handleAuthenticationResult(_ error: Error?) {
        if let error = error {
            print("Sign-up error: \(error.localizedDescription)")
            // Show error
        } else {
            print("Signed up successfully!")
            isSignUpCompleted = true
        }
        // Show result
    }
    
    func checkPassword() -> Bool {
            let specialChar = ".*[^A-Za-z0-9].*"
            return NSPredicate(format: "SELF MATCHES %@", specialChar).evaluate(with: password)
        }
    
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Signup().environmentObject(AuthManager())
    }
}
