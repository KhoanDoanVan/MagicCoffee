//
//  LoginViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var isSuccess = false
    @Published var errorMessage = ""
    
    func requestLogin() async {
        do {
            try await LoginService.requestLogin(email: email, password: password)
            print("Login Success !!!")
            isSuccess = true
            errorMessage = ""
        } catch {
            print("Error in Login View Model")
            errorMessage = "Email or password is not correct !!!"
        }
    }
    
}
