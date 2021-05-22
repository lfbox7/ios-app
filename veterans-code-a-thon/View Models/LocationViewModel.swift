//
//  LocationManager.swift
//  SAParkFinder
//
//  Created by Leonard Box on 2/24/20.
//  Copyright © 2020 Leonard Box. All rights reserved.
//

import Foundation
import Combine
import CoreLocation

class LocationViewModel: NSObject, ObservableObject {
    @Published var currentLatitude: Double = 0.0
    @Published var currentLongitude: Double = 0.0
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationViewModel: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        currentLatitude = location.coordinate.latitude
        currentLongitude = location.coordinate.longitude
        print(location)
    }
}
