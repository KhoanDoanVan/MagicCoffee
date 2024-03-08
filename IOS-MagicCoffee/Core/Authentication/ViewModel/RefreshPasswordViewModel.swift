//
//  RefreshPasswordViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 06/03/2024.
//

import Foundation

@MainActor
class RefreshPasswordViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var verifyPassword = ""
    @Published var check = false
    @Published var errorString = ""
    @Published var isSuccess  = false
    
    
    func checkVerifyPassword(){
        if password != verifyPassword {
            check = false
            errorString = "Password not match with Verify Password"
        } else {
            check = true
        }
    }
    
    func requestRefreshPassword() async {
        do {
            try await RefreshPasswordService.requestRefreshPassword(email: email, password: password)
            isSuccess = true
        } catch {
            isSuccess = false
            errorString = "Error with Server"
            print("Error Refresh Password View Model")
        }
    }
}
