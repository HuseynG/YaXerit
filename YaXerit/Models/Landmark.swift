//
//  Landmark.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 23/06/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//

import Foundation
import MapKit

struct Landmark {
    
    let placemark: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
