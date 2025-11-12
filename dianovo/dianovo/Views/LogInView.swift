//
//  WelcomeView.swift
//  dianovo
//
//  Created by Emilia Kościelniak on 22/10/2025.
//
import SwiftUI

struct LogInView: View {
    var body: some View {
        @State var email: String = ""
        @State var password: String = ""
        @State var passwordRepeat: String = ""
        @State var isChecked = false
        
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
                        
                        VStack(spacing:20){
                            TextField("Enter email", text: $email)
                                .padding(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(style: StrokeStyle(lineWidth: 1))
                                        .foregroundColor(Color.gray)
                                )
                            SecureField("Enter password", text: $password)
                                .padding(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(style: StrokeStyle(lineWidth: 1))
                                        .foregroundColor(Color.gray)
                                )
                            SecureField("Repeat password", text: $passwordRepeat)
                                .padding(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(style: StrokeStyle(lineWidth: 1))
                                        .foregroundColor(Color.gray)
                                )
                            Toggle("I have read and accept terms and privacy policy.. etc etc ", isOn: $isChecked)
                                .toggleStyle(CheckboxStyle())
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                        }
                        .padding(40)
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
