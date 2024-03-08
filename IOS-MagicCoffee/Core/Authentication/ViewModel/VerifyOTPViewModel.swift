//
//  VerifyOTPViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 06/03/2024.
//

import Foundation

@MainActor
class VerifyOTPViewModel: ObservableObject{
    @Published var otpArray = [
        "","","","","",""
    ]
    @Published var errorMessage = ""
    @Published var email = ""
    @Published var isSuccess = false
    
    func requestVerifyOTP() async {
        do {
            try await VerifyOTPService.requestVerifyOTP(email: email, otp: convertStringOTP())
            isSuccess = true
        } catch {
            isSuccess = false
            errorMessage = "Invalid Verify Code !!! Please again"
            print("Invalid Verify Code !!! Please again")
        }
    }
    
    func convertStringOTP() -> String {
        var string = ""
        
        for charater in otpArray {
            string += charater
        }
        
        return string
    }
}
