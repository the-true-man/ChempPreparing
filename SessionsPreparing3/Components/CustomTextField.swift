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
    let isSecure: Bool
    @State var showPassword: Bool = false
    @FocusState var isFocused: Bool
    @Binding var text: String
    
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
                    ZStack(alignment: .leading){
                        TextField("", text: $text)
                            .textFieldStyle(CustomTextFieldStyle())
                        if(text.isEmpty){
                            Text(placeholder)
                                .font(.system(size: 14))
                                .foregroundColor(.hint)
                                .padding(.horizontal, 14)
                        }
                    }
                }
                else{
                    
                    ZStack(alignment: .trailing){
                        ZStack(alignment: .leading){
                            if(showPassword){
                                TextField("", text: $text)
                                    .textFieldStyle(CustomTextFieldStyle())
                            }
                            else{
                                SecureField("", text: $text)
                                    .textFieldStyle(CustomTextFieldStyle())
                            }
                            if(text.isEmpty){
                                Text(placeholder)
                                    .font(.system(size: 14))
                                    .foregroundColor(.hint)
                                    .padding(.horizontal, 14)
                            }
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
    CustomTextField(label: "Email", placeholder: "••••••••", text: .constant(""), isSecure: true)
}
