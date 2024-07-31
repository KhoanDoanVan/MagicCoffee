//
//  ButtonRistretto.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 22/03/2024.
//

import SwiftUI

struct ButtonRistretto: View {
    @StateObject var viewModel : OrderViewModel
    var textButton : String
    
    var body: some View {
        Text(textButton)
            .frame(width : 50, height: 30)
            .padding(.horizontal, 20)
            .overlay{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            }
            .background(viewModel.restritto == textButton ? Color("CyanDark") : Color(.white))
            .cornerRadius(20)
            .foregroundColor(viewModel.restritto == textButton ? .white : .black)
    }
}

#Preview {
    ButtonRistretto(viewModel: OrderViewModel(), textButton: "Button Text")
}

