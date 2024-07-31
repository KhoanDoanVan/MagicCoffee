//
//  Redeem.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 26/03/2024.
//

import Foundation

struct Redeem: Identifiable{
    let id = UUID()
    var coffeeName : String
    var coffeeImage : String
    var validTime : Date
    var pts : Int
    var active : Bool
}
