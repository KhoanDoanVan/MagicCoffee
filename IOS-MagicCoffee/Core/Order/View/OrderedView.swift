//
//  OrderedView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 29/03/2024.
//

import SwiftUI

struct OrderedView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image("orderIcon")
                Text("Ordered")
                Text("Alex, your order has been successfully placed.")
                Text("""

                """)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement : .topBarLeading){
                    Button{
                        
                    }label: {
                        Image("arrow.backward")
                            .padding()
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    OrderedView()
}
