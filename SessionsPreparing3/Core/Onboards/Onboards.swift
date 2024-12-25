//
//  Onboard1.swift
//  SessionsPreparing3
//
//  Created by Евгений Михайлов on 24.12.2024.
//

import SwiftUI

struct Onboards: View {
    @AppStorage("currentOnboard") private var currentOnboard: Int = 0
    @State var textInButton: String = "Начать"
    @State var isNavigate: Bool = false
    
    var body: some View {
        VStack{
            if(currentOnboard==0) {
                Spacer()
                    .frame(height: 70)
                Text("добро\nпожаловать".uppercased())
                    .foregroundColor(.block)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                Spacer()
                    .frame(height: 130)
                Image(.onboard1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 26)
            }
            else if currentOnboard==1 {
                Spacer()
                    .frame(height: 80)
                Image(.onboard2)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                    .frame(height: 60)
                Text("Начнём\nпутешествие")
                    .foregroundColor(.block)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 34))
                Spacer()
                    .frame(height: 12)
                Text("Умная, великолепная и модная коллекция Изучите сейчас")
                    .foregroundColor(.subLightText)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
            }
            else if currentOnboard == 2 {
                Spacer()
                    .frame(height: 80)
                Image(.onboard3)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                    .frame(height: 60)
                Text("У вас есть сила,\nчтобы".capitalized)
                    .foregroundColor(.block)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 34))
                Spacer()
                    .frame(height: 12)
                Text("В вашей комнате много красивых и привлекательных растений")
                    .foregroundColor(.subLightText)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
            }
            CountPages(countPages: 3, currentPage: $currentOnboard)
            Spacer()
            Button(action: {
                    nextOnboard()
                
            }) {
                Text(textInButton)
                    .foregroundColor(.text)
                    .font(.system(size: 14))
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.block)
                    .clipShape(.rect(cornerRadius: 15))
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 36)
        }
        .ignoresSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [Color.accent, Color.disable], startPoint: .top, endPoint: .bottom))
    }
    func nextOnboard() {
        withAnimation(.spring()) {
            if(currentOnboard+1 > 2){
                currentOnboard = -1
                //isNavigate = true
            }
            currentOnboard += 1
            textInButton = currentOnboard == 0 ? "Начать" : "Далее"
        }
    }
}

#Preview {
    Onboards()
}
