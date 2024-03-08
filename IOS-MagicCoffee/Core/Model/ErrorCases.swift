//
//  ErrorCases.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import Foundation

enum ErrorCases : LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidJson
    
    var errorDescription : String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidResponse: return "Invalid Response"
        case .invalidData: return "Invalid Data"
        case .invalidJson: return "Invalid JSON"
        }
    }
}


enum DataError: Error {
    case networkError(Error)
    case decodingError(Error)
    case serverError(HTTPURLResponse?, Data?)
}
