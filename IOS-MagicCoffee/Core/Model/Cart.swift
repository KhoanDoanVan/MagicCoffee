//
//  CartItem.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 25/03/2024.
//

import Foundation

struct Cart: Hashable,Identifiable {
    let id = UUID()
    var nameCoffee: String
    var imageCoffee: String
    var total : CGFloat
    var orderCoffee: Order

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Cart, rhs: Cart) -> Bool {
        return lhs.id == rhs.id
    }
}
