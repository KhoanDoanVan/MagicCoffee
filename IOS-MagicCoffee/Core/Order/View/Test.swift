//
//  Test.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 22/03/2024.
//

import SwiftUI

struct Test: View {
    var body: some View {
        VStack{
            HStack{
                Text("Total Amount")
                Spacer()
                Text("VND: 30.000")
            }
            .padding(.horizontal, 10)
            .fontWeight(.semibold)
            
            Button{
                
            } label: {
                Text("Next")
                    .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .background(Color("CyanDark"))
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
        }
    }
}

#Preview {
    Test()
}
