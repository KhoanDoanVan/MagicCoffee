//
//  ProfileViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 25/03/2024.
//

import Foundation
import CoreImage.CIFilterBuiltins
import SwiftUI


class ProfileViewModel: ObservableObject{
    
    @Published var user : User = User(username: "Simon", email: "simonisdev@gmail.com", phonenumber: "+84 868720155")
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    @Published var information: String = ""
    
    func userInformationQR(){
        self.information = """
        * User name: \(user.username)
        * Phone number: \(user.phonenumber)
        * Email: \(user.email)
        * Magic Coffee store address: \(user.addressCoffee)
        """
    }
    
    func generateQRCodeImage() -> Image {
        
        guard let data = information.data(using: .utf8) else {
            return Image(systemName: "xmark")
        }
        
        filter.setValue(data, forKey: "inputMessage")
        guard let outputImage = filter.outputImage else {
            return Image(systemName: "xmark")
        }
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return Image(systemName: "xmark")
        }
        
        return Image(uiImage: UIImage(cgImage: cgImage))
    }
}
