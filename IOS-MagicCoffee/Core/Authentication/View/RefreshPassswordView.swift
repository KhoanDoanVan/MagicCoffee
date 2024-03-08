//
//  RefreshPasswordView.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import SwiftUI

struct RefreshPassswordView: View {
    @StateObject private var viewModel = RefreshPasswordViewModel()
    @State private var isPublishPassword = false
    @State private var isPublishVerifyPassword = false
    
    @Binding var email : String
    
    init(email : Binding<String>) {
        _email = email
    }
    
    var body: some View {
        NavigationStack{
            
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
                        Text("Refresh Password")
                            .font(.system(size: 30))
                            .padding(.vertical, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                    HStack{
                        Text("")
                            .foregroundStyle(Color(.systemGray))
                            .padding(.vertical, 20)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                    // Field Text
                    VStack(spacing : 20){
                        VStack(spacing : 10){
                            HStack{
                                Image(systemName: "lock")
                                    .frame(width: 30)
                                
                                Rectangle()
                                    .frame(width: 1, height: 15)
                                    .foregroundColor(Color(.systemGray4))

                                if isPublishPassword{
                                    TextField("New Password", text: $viewModel.password)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                } else {
                                    SecureField("New Password", text: $viewModel.password)
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
                            
                            HStack{
                                Image(systemName: "lock")
                                    .frame(width: 30)
                                
                                Rectangle()
                                    .frame(width: 1, height: 15)
                                    .foregroundColor(Color(.systemGray4))

                                if isPublishVerifyPassword{
                                    TextField("Verify Password", text: $viewModel.verifyPassword)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                } else {
                                    SecureField("Verify Password", text: $viewModel.verifyPassword)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                }
                                
                                if isPublishVerifyPassword{
                                    Button{
                                        withAnimation{
                                            isPublishVerifyPassword.toggle()
                                        }
                                    } label: {
                                        Image(systemName: "eye.slash")
                                    }
                                    .foregroundColor(.black)
                                } else {
                                    Button{
                                        withAnimation{
                                            isPublishVerifyPassword.toggle()
                                        }
                                    } label: {
                                        Image(systemName: "eye")
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                            .padding(.top)
                            Divider()
                            
                            if viewModel.errorString != "" {
                                Text(viewModel.errorString)
                                    .font(.footnote)
                                    .foregroundStyle(.red)
                            }

                        }
                        .padding(.vertical, 0)
                    
                    }
                    .frame(width: 330, height: 100)
                    .padding(.vertical, 40)
                    
                    Spacer()
                }
                
                HStack{
                    Spacer()
                    
                    Button{
                        viewModel.checkVerifyPassword()
                        viewModel.email = email
                        
                        if viewModel.check {
                            Task {
                                await viewModel.requestRefreshPassword()
                            }
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
    RefreshPassswordView(email : .constant("doan@gmail.com"))
}
