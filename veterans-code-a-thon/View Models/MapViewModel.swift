//
//  MapViewModel.swift
//  veterans-code-a-thon
//
//  Created by Leonard Box on 5/22/21.
//  Copyright © 2021 Leonard Box. All rights reserved.
//

import SwiftUI
import Foundation
import Combine
import CoreLocation

class MapViewModel: ObservableObject {
    @ObservedObject var locationViewModel = LocationViewModel()
    var businesses: Business
    
    init(businesses: Business) {
        self.businesses = businesses
        findDistance()
    }
    
    func findDistance() -> CLLocationDistance {
        let homeCoordinate = CLLocation(latitude: locationViewModel.currentLatitude, longitude: locationViewModel.currentLongitude)
        let geoCoder = CLGeocoder()
        var lat: CLLocationDegrees = locationViewModel.currentLatitude
        var lon: CLLocationDegrees = locationViewModel.currentLongitude
        let address = businesses.address1 + " " + businesses.city + ", " + businesses.state
        
        geoCoder.geocodeAddressString(address) { placemarks, error in
            let placemark = placemarks?.first
            lat = (placemark?.location?.coordinate.latitude)!
            lon = (placemark?.location?.coordinate.longitude)!
        }
        
        let businessCoordinate = CLLocation(latitude: lat, longitude: lon)
        
        let distance = homeCoordinate.distance(from: businessCoordinate) * 0.000621371
        
        return distance
    }
}
