import SwiftUI
import GoogleMaps
import Combine

struct GoogleMapView: UIViewRepresentable {

    // Listen to changes on the locationManager
    @ObservedObject var locationManager = LocationManager2()

    func makeUIView(context: Self.Context) -> GMSMapView {
        //
        let locationManagerDefault = CLLocationManager()
        locationManagerDefault.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
//            locationManagerDefault.delegate = self
            locationManagerDefault.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManagerDefault.startUpdatingLocation()
        }
        
        
        let camera = GMSCameraPosition.camera(withLatitude: (locationManagerDefault.location?.coordinate.latitude)!,
        longitude: (locationManagerDefault.location?.coordinate.longitude)!,
        zoom: 15.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.animate(to: camera)
        
        //
        
        mapView.setMinZoom(4, maxZoom: 20)
        mapView.settings.compassButton = true //
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true //
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        mapView.settings.rotateGestures = true
        mapView.settings.tiltGestures = true
        mapView.isIndoorEnabled = false

        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {

        // When the locationManager publishes updates, respond to them
        if let myLocation = locationManager.lastKnownLocation {
//            mapView.animate(toLocation: myLocation.coordinate)
            print("User's location: \(myLocation)")
//            print("User's coordinates: \(myLocation.coordinate.latitude)")

        }
    }
}

