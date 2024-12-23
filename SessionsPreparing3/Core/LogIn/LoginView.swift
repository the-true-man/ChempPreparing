//
//  LoginView.swift
//  SessionsPreparing3
//
//  Created by Евгений Михайлов on 23.12.2024.
//

import SwiftUI
import Supabase
import Auth
struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var messageInAlert: String = ""
    @State var isloading: Bool = false
    @State var isNavigate: Bool = false
    @State var isError: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("Привет!")
                    .foregroundColor(.text)
                    .font(.system(size: 32))
                Spacer()
                    .frame(height: 8)
                Text("Заполните Свои данные или\nпродолжите через социальные медиа".capitalized)
                    .foregroundColor(.subDarkText)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(height: 25)
                CustomTextField(label: "Email", placeholder: "xyz@gmail.com", text: $email)
                Spacer()
                    .frame(height: 26)
                CustomTextField(label: "Пароль", placeholder: "********", text: $password, isSecure: true)
                Spacer()
                    .frame(height: 16)
                HStack{
                    Spacer()
                    Text("Восстановить")
                        .foregroundColor(.subDarkText)
                        .font(.system(size: 12))
                }
                Spacer()
                    .frame(height: 24)
                Button(action: {
                    logIn(email: email, password: password)
                } ){
                    Text("Войти")
                        .foregroundColor(.background)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.accent)
                        .clipShape(.rect(cornerRadius: 15))
                }
                Spacer()
                    .frame(height: 209)
                HStack{
                    Text("Вы впервые?")
                        .foregroundColor(.hint)
                        .font(.system(size: 16))
                    Text("Создать пользователя")
                        .foregroundColor(.text)
                        .font(.system(size: 16))
                }
                Spacer()
                    .frame(height: 50)
            }
            .onLoading(isLoading: isloading)
            .alert("Ошибка", isPresented: $isError) {
                Button("OK", role: .cancel) {}
                
            } message: {
                Text(messageInAlert)
            }
            .ignoresSafeArea(.all)
            .padding(.horizontal, 20)
            .navigationDestination(isPresented: $isNavigate) { EmptyView()
                .navigationBarBackButtonHidden(true)}
        }
        
    }
    func printAlert(message: String) {
        isError = true
        messageInAlert = message
    }
}

#Preview {
    LoginView()
}


extension LoginView {
    func logIn(email: String, password: String){
        if !email.validateEmail() {
            printAlert(message: "Некорректный email")
            return
        }
        if password.validatePassword() {
            printAlert(message: "Не верный формат пароля")
            return
        }
        Task {
            isloading = true
            do{
                try await SupabaseService.instance.login(email: email, password: password)
                isNavigate = true
            }
            catch {
                if let supabaseError = error as? AuthError  {
                    
                    switch supabaseError.errorCode{
                    case ErrorCode.invalidCredentials:
                        printAlert(message: "Неверный логин или пароль")
                    default:
                        printAlert(message: error.localizedDescription)
                    }
                }
                else if let networkError = error as? URLError {
                    switch networkError.code {
                    case .notConnectedToInternet:
                        printAlert(message: "Проверьте подключение к интернету")
                    default:
                        printAlert(message: networkError.localizedDescription)
                    }
                }
                else {
                    printAlert(message: error.localizedDescription)
                }
            }
            isloading = false
        }
        
    }
}
