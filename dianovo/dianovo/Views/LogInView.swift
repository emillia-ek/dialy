import SwiftUI

struct LogInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordRepeat: String = ""
    @State var isChecked = false
    
    @State private var errorEmail: String = ""
    @State private var errorPassword: String = ""
    @State private var errorRepeatPassword: String = ""
    @State private var globalError: String = ""
    
    var body: some View {
        ZStack {
            backgroundGradient
            content
        }
    }
    
    // MARK: - Background
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [Color.darkBlue, Color.lightGradientBlue],
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
        .ignoresSafeArea()
    }
    
    // MARK: - Main layout container
    private var content: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                VStack {
                       mainForm
                   }
                   .frame(maxWidth: .infinity)
                   .frame(height: geometry.size.height * 0.8)
                   .background(Color.white)
                   .cornerRadius(40)
            }
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Main white container
    private var mainForm: some View {
        VStack(alignment: .center, spacing: 5) {
            headerSection
            inputSection
            actionButtonsSection
            
            Spacer()
        }
        .padding(40)
    }
    
    
    // MARK: - HEADER
    private var headerSection: some View {
        VStack(spacing: 5) {
            Text("Create your account!")
                .font(.title)
                .padding(.top, 20)
                .foregroundColor(.darkBlue)
                .fontWeight(.semibold)
            
            Text("We’re here to help you with your everyday routine!")
                .font(.headline)
                .padding(.horizontal, 25)
                .padding(.bottom, 30)
                .foregroundColor(.black)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
        }
    }
    
    
    // MARK: - INPUTS
    private var inputSection: some View {
        VStack(spacing: 20) {
            emailField
            passwordField
            repeatPasswordField
            
            Toggle("I accept terms and privacy policy", isOn: $isChecked)
                .toggleStyle(CheckboxStyle())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if !globalError.isEmpty {
                Text(globalError)
                    .foregroundColor(.red)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private var emailField: some View {
        VStack(alignment: .leading, spacing: 5) {
            TextField("Enter email", text: $email)
                .padding(15)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
            
            if !errorEmail.isEmpty {
                Text(errorEmail)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
    }
    
    private var passwordField: some View {
        VStack(alignment: .leading, spacing: 5) {
            SecureField("Enter password", text: $password)
                .padding(15)
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
            
            if !errorPassword.isEmpty {
                Text(errorPassword)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
    }
    
    private var repeatPasswordField: some View {
        VStack(alignment: .leading, spacing: 5) {
            SecureField("Repeat password", text: $passwordRepeat)
                .padding(15)
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
            
            if !errorRepeatPassword.isEmpty {
                Text(errorRepeatPassword)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
    }
    
    
    
    private var actionButtonsSection: some View {
        VStack {
            Button(action: validateForm) {
                Text("Get started")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(
                            colors: [Color.darkBlue, Color.lightGradientBlue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(30)
            }
            
            HStack(alignment: .center) {
                Rectangle().frame(height: 1).foregroundColor(.gray)
                
                Text("or sign up with")
                    .padding(8)
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .lineLimit(1)
                
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 20) {
                Image("facebook_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
                Image("google_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
                Image("apple_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            .padding(.bottom, 10)
            
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
            }
        }
        .padding(15)
    }
    
    
    // MARK: - Validation
    
    var isFormValid: Bool {
        return !email.isEmpty &&
        isValidEmail(email) &&
        password.count >= 6 &&
        password == passwordRepeat &&
        isChecked
    }
    
    func validateForm() {
        errorEmail = isValidEmail(email) ? "" : "Invalid email format"
        errorPassword = password.count >= 6 ? "" : "Password must be at least 6 characters"
        errorRepeatPassword = passwordRepeat == password ? "" : "Passwords do not match"
        
        globalError = isChecked ? "" : "You must accept the terms"
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
}

#Preview {
    LogInView()
}
