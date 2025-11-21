//
//  ButtonStyles.swift
//  dianovo
//
//  Created by Emilia Kościelniak on 12/11/2025.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(configuration.isOn ? .gray : .gray)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }
}
