//
//  AssemblageViewModel.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 23/03/2024.
//

import Foundation


class AssemblageViewModel: ObservableObject{
    @Published var roasting : String = "medium"
    @Published var speed : CGFloat = 50.0
    @Published var grind : String = "small"
    @Published var ice : String = "medium"
    
    var listMike : [Milk] = [
        Milk(name: "none"),
        Milk(name: "cow's"),
        Milk(name: "lactose"),
        Milk(name: "skimmed"),
        Milk(name: "vegetable")
    ]
    
    @Published var milkSelected : String = "None"
    
    var listSyrup : [Syrup] = [
        Syrup(name: "none"),
        Syrup(name: "amarreto"),
        Syrup(name: "coconut"),
        Syrup(name: "vanila"),
        Syrup(name: "caramel")
    ]
    
    @Published var syrupSelected : String = "None"
    
    var listBarista : [Barista] = [
        Barista(name: "Simon", role: "Barista", status: true, image: "avatarCoffee"),
        Barista(name: "Sandy", role: "Top Barista", status: false, image: "avatarCoffee2"),
    ]
    
    @Published var baristaSelected : Barista = Barista(name: "Simon", role: "Barista", status: true, image: "avatarCoffee")
    
    var countries : [Country] = [
        Country(name: "Colombia", cities: [
            City(name: "Bogota"),
            City(name: "Medellin"),
            City(name: "Cali")
        ]),
        Country(name: "Brazil", cities: [
            City(name: "Rio de Janeiro"),
            City(name: "São Paulo"),
            City(name: "Brasília")
        ]),
        Country(name: "India", cities: [
            City(name: "Delhi"),
            City(name: "Mumbai"),
            City(name: "Bangalore")
        ]),
        Country(name: "Costa Rica", cities: [
            City(name: "San Jose"),
            City(name: "Limon"),
            City(name: "Heredia")
        ]),
        Country(name: "Vietnam", cities: [
            City(name: "Ho Chi Minh City"),
            City(name: "Hanoi"),
            City(name: "Da Nang")
        ]),
        Country(name: "Indonesia", cities: [
            City(name: "Jakarta"),
            City(name: "Surabaya"),
            City(name: "Bandung")
        ])
    ]
    
    @Published var countrySelected : Country = Country(name: "Colombia", cities: [
                                                            City(name: "Bogota"),
                                                            City(name: "Medellin"),
                                                            City(name: "Cali")
                                                        ])
    @Published var citySelected : City = City(name: "Bogota")
    
    var listAdditives = [
        Additive(name: "Ceylon cinnamon"),
        Additive(name: "Grated chocolate"),
        Additive(name: "Liquid chocolate"),
        Additive(name: "Marshmallow"),
        Additive(name: "Whipped cream"),
        Additive(name: "Cream"),
        Additive(name: "Nutmeg"),
        Additive(name: "Ice cream")
    ]
    
    @Published var additiveSelected : [Additive] = []
}
