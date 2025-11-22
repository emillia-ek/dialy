import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var passwordRepeat = ""
    @State private var isChecked = false
    
    var body: some View {
        ZStack {
            GradientBackground()
            GeometryReader { geometry in
                        VStack {
                            Spacer()
                            VStack{
                                AuthHeader(title: "Create your account", subtitle: "We’re here to help you with your everyday routine!")
                                SignUpForm(
                                    email: $email,
                                    password: $password,
                                    passwordRepeat: $passwordRepeat,
                                    isChecked: $isChecked
                                )
                                Spacer()
                            }
                            .padding(40)
                               .frame(maxWidth: .infinity)
                               .frame(height: geometry.size.height * 0.8)
                               .background(Color.white)
                               .cornerRadius(40)
                        }
                    }
                    .ignoresSafeArea()
            }
        }
    }

struct SignUpForm: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordRepeat: String
    @Binding var isChecked: Bool
    @State private var navigate = false
    
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
            
            AuthTextField(
                placeholder: "Repeat password",
                text: $passwordRepeat,
                isSecure: true,
                error: errors["repeat"] ?? ""
            )
            
            Toggle("I accept terms and privacy policy", isOn: $isChecked)
                .toggleStyle(CheckboxStyle())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let globalError = errors["global"], !globalError.isEmpty {
                Text(globalError)
                    .foregroundColor(.red)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            AuthSubmitButton(title: "Sign up"){
                errors = FormValidator.validate(
                                    email: email,
                                    password: password,
                                    repeatPassword: passwordRepeat,
                                    isChecked: isChecked
                                )
            }
            
            HStack {
                Rectangle().frame(height: 1).foregroundColor(.gray)
                Text("or sign up with").foregroundColor(.gray).font(.footnote)
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }
            AuthSocialButtons()
            HStack {
                Text("Already have an account?")
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                Text("Sign in")
                    .font(.footnote)
                    .overlay(
                        LinearGradient(
                            colors: [Color.mediumBlue, Color.darkBlue],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .mask(
                            Text("Sign in")
                                .font(.footnote)
                        )
                    )
                    .onTapGesture {
                        navigate = true
                    }
                    .navigationDestination(isPresented: $navigate) {
                        SignInView().navigationBarBackButtonHidden()
                    }
            }
        }
    }
    
    // MARK: - Validation
    private func validateForm() {
        errors["email"] = isValidEmail(email) ? "" : "Invalid email format"
        errors["password"] = password.count >= 6 ? "" : "Password must be at least 6 characters"
        errors["repeat"] = passwordRepeat == password ? "" : "Passwords do not match"
        errors["global"] = isChecked ? "" : "You must accept the terms"
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}
#Preview {
    SignUpView()
}
