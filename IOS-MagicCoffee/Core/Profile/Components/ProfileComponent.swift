//
//  ProfileComponent.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 25/03/2024.
//

import SwiftUI

struct ProfileComponent: View {
    var icon : String
    var title : String
    var text : String
    @Binding var showEdit : Bool
    
    var body: some View {
        HStack{
            HStack(spacing: 10){
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(.systemGray6))
                    .cornerRadius(50)
                    .overlay{
                        Image(systemName: icon)
                            .font(.system(size: 20))
                    }
                VStack(alignment : .leading){
                    Text(title)
                        .foregroundStyle(Color(.systemGray))
                        .font(.footnote)
                    Text(text)
                        .fontWeight(.semibold)
                }
            }
            Spacer()
            Button{
                showEdit.toggle()
            }label: {
                Image("Edit")
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    ProfileComponent(icon: "person" ,title: "Name", text: "Simon", showEdit: .constant(true))
}
