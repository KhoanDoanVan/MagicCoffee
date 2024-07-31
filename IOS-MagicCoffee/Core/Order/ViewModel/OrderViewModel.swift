//
//  OrderViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 22/03/2024.
//

import Foundation


class OrderViewModel: ObservableObject {
    @Published var amountState : Int = 0
    @Published var restritto : String = "None"
    @Published var isOnsite : Bool = true
    @Published var volume : String = "medium"
    @Published var isTime : Bool = false
    @Published var timePicker : Date = Date()
}
