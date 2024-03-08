//
//  ButtonCircleView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import SwiftUI

struct ButtonCircleView: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 70, height: 70)
                .foregroundColor(Color("CyanDark"))

            Image(systemName: "arrow.right")
                .font(.system(size: 30))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ButtonCircleView()
}
