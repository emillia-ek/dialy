import SwiftUI

struct AuthSocialButtons: View {
    var body: some View {
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
    }
}
