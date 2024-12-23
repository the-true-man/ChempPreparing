//
//  View.swift
//  SessionsPreparing3
//
//  Created by Евгений Михайлов on 23.12.2024.
//

import SwiftUI

extension View{
    @ViewBuilder
    func onLoading(isLoading: Bool) -> some View{
        if isLoading{
            ZStack{
                self
                ProgressView()
            }
        }else{
            self
        }
    }
}
