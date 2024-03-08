//
//  RegisteredViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import Foundation

@MainActor
class RegisteredViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var nameAccount = ""
    @Published var errorMessage = ""
    @Published var successMessage = ""
    
    func requestRegistered() async {
        do {
            print(email, password, nameAccount)
            try await RegisteredService.requestRegistered(email: email, password: password, username: nameAccount)
            successMessage = "Successfull !!!"
            errorMessage = ""
        } catch {
            errorMessage = "What's wrong ???"
            successMessage = ""
            print("Error with Registered View Model")
        }
    }
}
