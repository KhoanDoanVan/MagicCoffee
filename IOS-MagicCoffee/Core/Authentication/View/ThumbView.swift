//
//  ThumbView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import SwiftUI

struct ThumbView: View {
    
    @State private var intializeOpen = true
    
    var body: some View {
        NavigationStack{
            if intializeOpen {
                ZStack{
                    Image("Thumb2")
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        
                    Image("Vector")
                        .padding(.top, -200)
                    
                    Image("Magic Coffee")
                        .padding(.top, -100)
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                        withAnimation{
                            intializeOpen = false
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            } else {
                MapView()
            }
        }
    }
}

#Preview {
    ThumbView()
}
