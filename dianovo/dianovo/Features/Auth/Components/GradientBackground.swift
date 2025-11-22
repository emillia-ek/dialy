import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            colors: [Color.darkBlue, Color.lightGradientBlue],
            startPoint: .bottomLeading,
            endPoint: .topTrailing
        )
        .ignoresSafeArea()
    }
}
