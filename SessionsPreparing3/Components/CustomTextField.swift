//
//  CustomTextField.swift
//  SessionsPreparing3
//
//  Created by Евгений Михайлов on 23.12.2024.
//

import SwiftUI

struct CustomTextField: View {
    var label: String
    var placeholder: String
    @Binding var text: String
    let isSecure: Bool
    @FocusState var isFocused: Bool

    @State var showPassword: Bool = false
    init(label: String, placeholder: String, text: Binding<String>, isSecure: Bool = false) {
        self.label = label
        self.placeholder = placeholder
        self._text = text
        self.isSecure = isSecure
    }
    var body: some View {
        VStack(alignment: .leading){
            Group{
                Text(label)
                    .font(.system(size: 16))
                    .foregroundColor(.text)
                Spacer()
                    .frame(height: 12)
                if(!isSecure){
                    TextField(placeholder, text: $text)
                        .textFieldStyle(CustomTextFieldStyle())
                }
                else{
                    ZStack(alignment: .trailing){
                        if(showPassword){
                            TextField(placeholder, text: $text)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                        else{
                            SecureField(placeholder, text: $text)
                                .textFieldStyle(CustomTextFieldStyle())
                        }
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(showPassword ? "eye" : "eye-slash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 24, maxHeight: 24)
                                .padding(.trailing, 14)
                        }
                    }
                }
            }
        }
        .focused($isFocused)
        .onTapGesture {isFocused = true}
    }
}

#Preview {
    CustomTextField(label: "Email", placeholder: "xyz@gmail.com", text: .constant(""), isSecure: true)
}
