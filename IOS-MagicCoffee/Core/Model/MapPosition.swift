//
//  MapPosition.swift
//  IOS-MagicCoffee
//
//  Created by Đoàn Văn Khoan on 06/03/2024.
//

import Foundation
import MapKit

extension CLLocationCoordinate2D{
    static var userLocation : CLLocationCoordinate2D{
        return .init(latitude : 10.742610, longitude : 106.685750)
    }
    
    // Coffee Positions
    static var coffeeA : CLLocationCoordinate2D{
        return .init(latitude: 10.744023, longitude: 106.685303)
    }
    static var coffeeB : CLLocationCoordinate2D{
        return .init(latitude: 10.744281, longitude: 106.687079)
    }
    static var coffeeC : CLLocationCoordinate2D{
        return .init(latitude: 10.742226, longitude: 106.686698)
    }
}


extension MKCoordinateRegion{
    static var userRegion : MKCoordinateRegion{
        return .init(center: .userLocation, latitudinalMeters: 500, longitudinalMeters: 500)
    }
}
