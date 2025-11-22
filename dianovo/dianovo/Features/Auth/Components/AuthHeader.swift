import SwiftUI

struct AuthHeader: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.title)
                .foregroundColor(.darkBlue)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            Text(subtitle)
                .font(.headline)
                .padding(.horizontal, 25)
                .padding(.bottom, 30)
                .foregroundColor(.black)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
        }
        
    }
}
