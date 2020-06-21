//
//  Map.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 20/06/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//
import MapKit
import SwiftUI
// CoreLocation

struct Map: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Map>) -> MKMapView {
        let mapView = MKMapView()
        
        //
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<Map>) {
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
