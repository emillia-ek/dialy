//
//  WelcomeView.swift
//  dianovo
//
//  Created by Emilia Kościelniak on 22/10/2025.
//
import SwiftUI

struct LogInView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.darkBlue, Color.lightGradientBlue],
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
            .ignoresSafeArea()
            
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    VStack(alignment: .center, spacing: 5) {
                        Text("Create your account!")
                            .font(.title)
                            .padding(EdgeInsets(top: 60, leading: 25, bottom: 5, trailing: 25))
                            .foregroundColor(.darkBlue)
                            .fontWeight(.semibold)
                        
                        Text("We’re here to help you with your everyday routine!")
                            .font(.headline)
                            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25))
                            .foregroundColor(.black)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.8)
                    .background(Color.white)
                    .cornerRadius(40)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LogInView()
}
