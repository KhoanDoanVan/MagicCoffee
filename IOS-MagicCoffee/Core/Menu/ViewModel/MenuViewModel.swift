//
//  MenuViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 20/03/2024.
//

import Foundation

enum CoffeeType : String,Identifiable, CaseIterable {
    var id: String { self.rawValue }
    
    case americano
    case cappuccino
    case latte
    case flat
    case raf
    case espresso
    
    var imageCoffee : String {
        switch self {
        case .americano : return "americano"
        case .cappuccino : return "cappuccino"
        case .latte : return "latte"
        case .flat : return "flat"
        case .raf : return "raf"
        case .espresso : return "espresso"
        }
    }
    
    var nameCoffee : String {
        switch self {
        case .americano : return "americano"
        case .cappuccino : return "cappuccino"
        case .latte : return "latte"
        case .flat : return "flat"
        case .raf : return "raf"
        case .espresso : return "espresso"
        }
    }
}
