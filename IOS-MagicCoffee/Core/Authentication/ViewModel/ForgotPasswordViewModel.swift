//
//  ForgotPasswordViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 06/03/2024.
//

import Foundation

@MainActor
class ForgotPasswordViewModel: ObservableObject{
    @Published var email = ""
    @Published var isSuccess = false
    
    func requestSendOTP() async {
        do {
            try await ForgotPasswordService.requestSendOTP(email: email)
            isSuccess = true
        } catch {
            isSuccess = false
            print("Error Forgot Password View Model")
        }
    }
}
