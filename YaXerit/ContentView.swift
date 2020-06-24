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
    
    @ObservedObject var locationManager = LocationManager()
    @State private var search = "Petrol"
    @State private var landmarks: [Landmark] = [Landmark]() // array of landmarks
    @State private var tapped: Bool = false
    
    
    // MK local search request for requesting local landmarks.
    private func getNearByLandmarks() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        //            request.naturalLanguageQuery = "Petrol"
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                
                let mapItems = response.mapItems
                self.landmarks = mapItems.map {
                    Landmark(placemark: $0.placemark)
                }
                
            }
            
        }
        
    }
    
    func calculateOffset() -> CGFloat {
        
        if self.landmarks.count > 0 && !self.tapped {
            return UIScreen.main.bounds.size.height - UIScreen.main.bounds.size.height / 4
        }
        else if self.tapped {
            return 100
        } else {
            return UIScreen.main.bounds.size.height
        }
    }
    
    
    var body: some View {
        ZStack {
            //direction
                
            //map here
            
            MapView(landmarks: landmarks).edgesIgnoringSafeArea(.all)
            
            VStack {
                //                TextField("Search for", text: $search, onEditingChanged: { _
                //                    in
                //                })
                //                {
                //                    //commit
                //                    self.getNearByLandmarks()
                //
                //
                //                }.textFieldStyle(RoundedBorderTextFieldStyle())
                //                    .padding()
                //                    .offset(y: 44)
                
                Button(action: {
                    self.getNearByLandmarks()
                }){
                    Text("YDM Tap").font(.system(size: 35)).foregroundColor(Color.white).padding( 10)
                        .background(Color(.systemGreen))
                        .cornerRadius(35)
                    
                }
                Spacer()
                
                
            }
            // list of search things here
            PlaceListView(landmarks: self.landmarks) {
                // on tap
                self.tapped.toggle()
            }.animation(.spring())
                .offset(y: calculateOffset())
            
            
            
            
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
