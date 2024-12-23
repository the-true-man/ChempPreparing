//
//  CustomTextFieldStyle.swift
//  SessionsPreparing3
//
//  Created by Евгений Михайлов on 23.12.2024.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 14)
            .frame(height: 48)
            .background(Color.background)
            .font(.system(size: 14))
            .foregroundColor(.text)
            .clipShape(.rect(cornerRadius: 15))
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
        
    }
}
