//
//  LocationManager2.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 19/07/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//

import SwiftUI
import GoogleMaps
import Combine

class LocationManager2: NSObject, CLLocationManagerDelegate, ObservableObject {

    // Publish the user's location so subscribers can react to updates
    @Published var lastKnownLocation: CLLocation? = nil
    private let manager = CLLocationManager()

    override init() {
        super.init()
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            self.manager.startUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Notify listeners that the user has a new location
        self.lastKnownLocation = locations.last
        guard let location = locations.last else { return }
        self.lastKnownLocation = location
    }
}
