import SwiftUI

struct ContentView: View {
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: -20) {
                Spacer()

                Image("dianovo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                Text("Asystent w cukrzycy typu 1 oparty na uczeniu maszynowym")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, 30)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    colors: [Color.darkBlue, Color.lightGradientBlue],
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
            )
            .ignoresSafeArea()
            .onTapGesture {
                navigate = true
            }
            .navigationDestination(isPresented: $navigate) {
                SignInView().navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview{
    ContentView()
}
