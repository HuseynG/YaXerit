//
//  MapView.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 23/06/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//

import SwiftUI
import MapKit
import Foundation

class Coordinator: NSObject, MKMapViewDelegate {

    var control: MapView

    init(_ control: MapView) {
        self.control = control
    }
    // this funciton is for zooming in.
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
        
    }
    
}



struct MapView: UIViewRepresentable {
    
    let landmarks: [Landmark] // for creating list of landmarks.
    
    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        //
        updateAnnotations(from: uiView)
    }
    
    // for showing all landmarks on map
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations) // removing first
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        mapView.addAnnotations(annotations) //adding to map
    }
    
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(landmarks: landmarks)
//    }
//}
