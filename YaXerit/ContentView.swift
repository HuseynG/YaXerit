//
//  ContentView.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 18/06/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
//    @State var Name: String = ""
//    @State var Pass: String = ""
    var body: some View {

        ZStack {
//            MapView().edgesIgnoringSafeArea(.all)
//            PlacesList()
            GoogleMapView().edgesIgnoringSafeArea(.all)

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
