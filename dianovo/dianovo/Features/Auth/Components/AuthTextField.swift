import SwiftUI

struct AuthTextField: View {
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var error: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {

            if isSecure {
                SecureField(placeholder, text: $text)
                    .padding(15)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
            } else {
                TextField(placeholder, text: $text)
                    .padding(15)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1))
            }

            if !error.isEmpty {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
        }
    }
}
