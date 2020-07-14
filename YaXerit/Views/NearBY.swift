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
}



struct MapView: UIViewRepresentable {
    
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
//        updateAnnotations(from: uiView)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
