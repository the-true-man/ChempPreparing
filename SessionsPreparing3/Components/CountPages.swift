//
//  CountPages.swift
//  SessionsPreparing3
//
//  Created by Евгений Михайлов on 25.12.2024.
//

import SwiftUI

struct CountPages: View {
    @State var countPages: Int
    @Binding var currentPage: Int
    init(countPages: Int, currentPage: Binding<Int>) {
        self.countPages = countPages
        self._currentPage = currentPage
    }
    
    var body: some View {
        HStack(spacing: 12){
            ForEach(0..<countPages){ index in
                Capsule()
                    .fill(index == currentPage ? Color.block : Color.disable)
                    .frame(maxWidth: index == currentPage ? 43 : 28, maxHeight: 5)
                    
            }
        }
    }
}

#Preview {
    CountPages(countPages: 3, currentPage: .constant(1))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
}
