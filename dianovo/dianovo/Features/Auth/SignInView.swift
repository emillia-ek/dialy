import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var navigateToSignUp = false
    
    var body: some View {
        ZStack {
            GradientBackground()
            GeometryReader { geometry in
                        VStack {
                            Spacer()
                            VStack{
                                AuthHeader(title: "Sign In", subtitle: "We’re here to help you with your everyday routine!")
                                SignInForm(
                                    email: $email,
                                    password: $password,
                                    navigateToSignUp: $navigateToSignUp
                                )
                                Spacer()
                            }
                            .padding(40)
                               .frame(maxWidth: .infinity)
                               .frame(height: geometry.size.height * 0.7)
                               .background(Color.white)
                               .cornerRadius(40)
                        }
                    }
                    .ignoresSafeArea()
            
            if navigateToSignUp {
                                SignUpView()
                                    .transition(.move(edge: .trailing)) // wchodzi z prawej
                                    .zIndex(1)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            navigateToSignUp = false
                                        }
                                    }
                            }
            }
        }
    }

struct SignInForm: View {
    @Binding var email: String
    @Binding var password: String
    
    @State private var navigate = false
    @Binding var navigateToSignUp: Bool
    
    @State private var errors: [String: String] = [:]
    
    var body: some View {
        VStack(spacing: 20) {
            AuthTextField(
                placeholder: "Enter email",
                text: $email,
                isSecure: false,
                error: errors["email"] ?? ""
            )
            
            AuthTextField(
                placeholder: "Enter password",
                text: $password,
                isSecure: true,
                error: errors["password"] ?? ""
            )
            
            if let globalError = errors["global"], !globalError.isEmpty {
                Text(globalError)
                    .foregroundColor(.red)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            AuthSubmitButton(title: "Sign in"){
                errors = FormValidator.validate(
                    email: email,
                    password: password
                )
            }
            
            HStack {
                Rectangle().frame(height: 1).foregroundColor(.gray)
                Text("or sign in with").foregroundColor(.gray).font(.footnote)
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }
            AuthSocialButtons()
            HStack {
                Text("Don't have an account?")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("Sign up")
                    .font(.footnote)
                    .overlay(
                        LinearGradient(
                            colors: [Color.mediumBlue, Color.darkBlue],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .mask(
                            Text("Sign up")
                                .font(.footnote)
                        )
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            navigateToSignUp = true
                        }
                    }
            }
        }
    }
    
    // MARK: - Validation
    private func validateForm() {
        errors["email"] = isValidEmail(email) ? "" : "Invalid email format"
        errors["password"] = password.count >= 6 ? "" : "Password must be at least 6 characters"
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}
#Preview {
    SignInView()
}
