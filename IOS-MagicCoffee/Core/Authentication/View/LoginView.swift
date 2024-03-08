//
//  LoginView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var isPublishPassword = false
    
    var body: some View {
        NavigationStack{
            
            // link invisible
            NavigationLink(
                destination: ThumbView(),
                isActive: $viewModel.isSuccess,
                label: { EmptyView() }
            )
            .hidden()
            
            // main
            ZStack{
                VStack(){
                    HStack{
                        Text("Sign in")
                            .font(.system(size: 30))
                            .padding(.vertical, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                    HStack{
                        Text("Welcome back")
                            .foregroundStyle(Color(.systemGray))
                            .padding(.vertical, 20)
                        
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

                        
                        VStack(spacing : 10){
                            HStack{
                                Image(systemName: "lock")
                                    .frame(width: 30)
                                
                                Rectangle()
                                    .frame(width: 1, height: 15)
                                    .foregroundColor(Color(.systemGray4))

                                if isPublishPassword{
                                    TextField("Password", text: $viewModel.password)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                } else {
                                    SecureField("Password", text: $viewModel.password)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                }
                                
                                if isPublishPassword{
                                    Button{
                                        withAnimation{
                                            isPublishPassword.toggle()
                                        }
                                    } label: {
                                        Image(systemName: "eye.slash")
                                    }
                                    .foregroundColor(.black)
                                } else {
                                    Button{
                                        withAnimation{
                                            isPublishPassword.toggle()
                                        }
                                    } label: {
                                        Image(systemName: "eye")
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                            Divider()
                            
                            if viewModel.errorMessage != "" {
                                Text(viewModel.errorMessage)
                                    .font(.footnote)
                                    .foregroundColor(.red)
                            }
                            
                            VStack(alignment : .center){
                                NavigationLink{
                                    ForgotPasswordView()
                                } label: {
                                    VStack{
                                        Text("Forgot password")
                                            .font(.system(size: 15))
                                        
                                        Rectangle()
                                            .frame(width: 120, height: 1)
                                            .padding(.top, -10)
                                    }
                                    .foregroundColor(.cyanDark)
                                }
                            }
                            .padding(.top, 10)
                        }
                        .padding(.vertical, 0)
                    
                    }
                    .frame(width: 330, height: 100)
                    .padding(.vertical, 40)
                    
                    Spacer()
                    
                    HStack{
                        HStack(spacing : 5){
                            Text("New member?")
                                .foregroundStyle(Color(.systemGray))
                            NavigationLink{
                                RegisteredView()
                            } label: {
                                Text("Sign up")
                                    .foregroundStyle(Color("CyanDark"))
                            }
                        }
                        .font(.system(size: 15))
                        .padding(.bottom, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                }
                
                HStack{
                    Spacer()
                    
                    Button{
                        Task {
                            await viewModel.requestLogin()
                        }
                    } label: {
                        ButtonCircleView()
                    }
                }
                .padding(.trailing, 50)
                .padding(.top, 200)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LoginView()
}
