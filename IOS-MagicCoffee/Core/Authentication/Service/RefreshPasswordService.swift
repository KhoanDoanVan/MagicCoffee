//
//  RefreshPasswordService.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 06/03/2024.
//

import Foundation


final class RefreshPasswordService{
    
    static func requestRefreshPassword(email : String, password : String) async throws {
        
        guard let url = URL(string : "http://localhost:3000/v1/api/refreshPassword") else {
            throw ErrorCases.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("4c5b3ae098e4145c643fbd03bf65ea0e318d23eee8a4f7ad4d8a2de7d0a971eae8ad02bb2cf467649117b45b88e34304c3eba6cab0b595a0dab928a78a0487ad", forHTTPHeaderField: "x-api-key")
        
        let requestBody : [String : Any] = [
            "email" : email,
            "password" : password
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                if !(200..<300).contains(httpResponse.statusCode){
                    throw DataError.serverError(httpResponse, data)
                }
            }
        } catch {
            throw ErrorCases.invalidData
        }
    }
}
