//
//  Registered.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import SwiftUI

struct RegisteredView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = RegisteredViewModel()
    @State private var phone = ""
    @State private var isPublishPassword = false
    
    var body: some View {
        NavigationStack{
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
                                Image(systemName: "person")
                                    .frame(width: 30)
                                
                                Rectangle()
                                    .frame(width: 1, height: 15)
                                    .foregroundColor(Color(.systemGray4))

                                TextField("Create an account here", text: $viewModel.nameAccount)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                            Divider()
                        }
                        .padding(.vertical, 0)
                        
                        VStack(spacing : 10){
                            HStack{
                                Image(systemName: "phone")
                                    .frame(width: 30)
                                
                                Rectangle()
                                    .frame(width: 1, height: 15)
                                    .foregroundColor(Color(.systemGray4))

                                TextField("Mobile Number", text: $phone)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                            Divider()
                        }
                        .padding(.vertical, 0)
                        
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
                            
                            if viewModel.successMessage != "" {
                                Text(viewModel.successMessage)
                                    .font(.footnote)
                                    .foregroundColor(.green)
                            }
                            
                            Text("By signing up you agree with our Terms of Use")
                                .font(.footnote)
                                .padding(.top)
                        }
                        .padding(.vertical, 0)
                    
                    }
                    .frame(width: 330, height: 200)
                    .padding(.vertical, 40)
                    
                    Spacer()
                    
                    HStack{
                        HStack(spacing : 5){
                            Text("Already a member?")
                                .foregroundStyle(Color(.systemGray))
                            Button{
                                dismiss()
                            } label: {
                                Text("Sign in")
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
                        Task{
                            await viewModel.requestRegistered()
                        }
                    } label: {
                        ButtonCircleView()
                    }
                }
                .padding(.trailing, 50)
                .padding(.top, 300)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    RegisteredView()
}

