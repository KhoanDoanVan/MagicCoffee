//
//  ForgotPasswordView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject private var viewModel = ForgotPasswordViewModel()
    
    
    var body: some View {
        NavigationStack{
            
            NavigationLink(
                destination: VerifyOTPView(email: $viewModel.email),
                isActive: $viewModel.isSuccess,
                label: { EmptyView() }
            )
            .hidden()

            
            ZStack{
                VStack(){
                    HStack{
                        Text("Forgot Password?")
                            .font(.system(size: 30))
                            .padding(.vertical, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                    HStack{
                        Text("Enter your email address")
                            .foregroundStyle(Color(.systemGray))
                            .padding(.vertical, 20)
                            .textInputAutocapitalization(.never)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                    // Field Text
                    VStack(spacing : 20){
                        VStack(spacing : 10){
                            HStack{
                                Image(systemName: "envelope")
                                    .frame(width: 30)
                                
                                Rectangle()
                                    .frame(width: 1, height: 15)
                                    .foregroundColor(Color(.systemGray4))

                                TextField("Email address", text: $viewModel.email)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .textInputAutocapitalization(.never)
                            }
                            Divider()
                        }
                        .padding(.vertical, 0)
                    }
                    .frame(width: 330, height: 100)
                    .padding(.vertical, 0)
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    
                    Button{
                        Task{
                            await viewModel.requestSendOTP()
                        }
                    } label: {
                        ButtonCircleView()
                    }
                }
                .padding(.trailing, 50)
                .padding(.top, 0)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ForgotPasswordView()
}
