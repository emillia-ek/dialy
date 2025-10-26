//
//  ContentView.swift
//  dianovo
//
//  Created by Emilia Kościelniak on 21/10/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var navigate = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Dianovo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                Text("Asystent w cukrzycy typu 1 oparty na uczeniu maszynowym")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
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
            .navigationDestination(isPresented: $navigate)
            {
                LogInView().navigationBarBackButtonHidden()
            }
        }
    }
}


#Preview {
    ContentView()
}
