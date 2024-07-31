//
//  CartViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 25/03/2024.
//

import Foundation

class CartViewModel: ObservableObject{
    @Published var listCart : [Cart] = [
        Cart(nameCoffee: "americano", imageCoffee: "americano", total: 30.000, orderCoffee: Order(amountState: 1, restritto: "One", isOnsite: true, volume: "medium", timePicker: Date(), assemblage: Assemblage(roasting: "medium", speed: 50.0, grind: "small", ice: "medium", milkSelected: "americano", syrupSelected: "coconut", baristaSelected: Barista(name: "Simon", role: "Barista", status: true, image: "avatarCoffee"), countrySelected: "Brazil", citySelected: "Santos", additiveSelected: [Additive(name: "cream"), Additive(name: "grated chocolate")]))),
        Cart(nameCoffee: "cappuccino", imageCoffee: "cappuccino", total: 90.000, orderCoffee: Order(amountState: 3, restritto: "One", isOnsite: true, volume: "medium", timePicker: Date(), assemblage: Assemblage(roasting: "medium", speed: 50.0, grind: "small", ice: "medium", milkSelected: "americano", syrupSelected: "coconut", baristaSelected: Barista(name: "Simon", role: "Barista", status: true, image: "avatarCoffee"), countrySelected: "Brazil", citySelected: "Santos", additiveSelected: [Additive(name: "cream"), Additive(name: "grated chocolate")])))
    ]
    
    @Published var totalPrice : CGFloat = 0.0
    
    @Published var paymentChoice : String = "OnlinePayment"
    
    func totalPriceIntoCart() -> CGFloat{
        var total : CGFloat = 0.0
        for item in listCart{
            total += item.total
        }
        return total
    }
    
    func addItemToList(item : Cart){
        listCart.append(item)
    }
    
    
    func removeItemFromList(item : Cart){
        listCart.removeAll{
            $0.id == item.id
        }
    }
}
