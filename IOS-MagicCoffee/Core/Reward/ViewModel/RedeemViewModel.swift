//
//  RedeemViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 26/03/2024.
//

import Foundation

class RedeemViewModel: ObservableObject{
    let calendar = Calendar.current
    
    @Published var listRedeem : [Redeem] = [
        Redeem(coffeeName: "cappuccino", coffeeImage: "cappuccino", validTime: Date(), pts: 1400, active: false),
        Redeem(coffeeName: "latte", coffeeImage: "latte", validTime: Date(), pts: 1350, active: false),
        Redeem(coffeeName: "raf", coffeeImage: "raf", validTime: Date(), pts: 1420, active: false),
    ]
    
    func getDateComponent(from date: Date) -> String {
        let dateComponent = calendar.component(.day, from: date)
        return "\(dateComponent)"
    }
    
    func getMonthComponent(from date: Date) -> String {
        let monthComponent = calendar.component(.month, from: date)
        return String(format: "%02d", monthComponent)
    }
    
    func getYearComponent(from date: Date) -> String {
        let yearComponent = calendar.component(.year, from: date)
        return String(format: "%02d", yearComponent)
    }
    
        
    func getDateFollowFormat(date: Date) -> String {
        let day = getDateComponent(from: date)
        let month = getMonthComponent(from: date)
        let year = getYearComponent(from: date)
        
        return "\(day).\(month).\(year)"
    }
    
    func checkActive(point: Int){
        for index in listRedeem.indices {
            if listRedeem[index].pts <= point {
                listRedeem[index].active = false
            } else {
                listRedeem[index].active = true
            }
        }
    }
}
