//
//  ErrorResponse.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 05/03/2024.
//

import Foundation

struct ErrorResponse: Codable{
    let code : String
    let status : Int
    let message : String
}
