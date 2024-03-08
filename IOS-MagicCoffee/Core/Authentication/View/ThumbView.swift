//
//  ThumbView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import SwiftUI

struct ThumbView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("Thumb2")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    
                Image("Vector")
                    .padding(.top, -200)
                
                Image("Magic Coffee")
                    .padding(.top, -100)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ThumbView()
}
