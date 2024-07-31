//
//  File.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 23/03/2024.
//

import Foundation

struct Barista: Identifiable{
    let id = UUID()
    var name : String
    var role : String
    var status : Bool = false
    var image : String
}
