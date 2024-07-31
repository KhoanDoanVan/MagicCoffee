//
//  Sort.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 23/03/2024.
//

import Foundation

struct City : Identifiable {
    let id = UUID()
    var name : String
}

struct Country : Identifiable {
    let id = UUID()
    var name : String
    var cities : [City]
}

