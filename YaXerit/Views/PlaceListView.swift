//
//  PlaceListView.swift
//  YaXerit
//
//  Created by Huseyn Gorbani on 23/06/2020.
//  Copyright © 2020 Huseyn Gorbani. All rights reserved.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [Landmark]
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
                .background(Color( UIColor(red: 0.6078, green: 0.0392, blue: 0, alpha: 1.0) )) // Color.red
                .gesture(TapGesture()
                    .onEnded(self.onTap)
            )
            
            List {
                
                ForEach(self.landmarks, id: \.id) { landmark in
                    
                    VStack(alignment: .leading) {
                        
                        
                        Button(action: {
                            print("\(landmark.name) tapped")
                        }){
                            Text(landmark.name)
                            .fontWeight(.bold)

                        }
                        Text(landmark.title)
//                        Text(landmark.coordinate)
                        
                        
                        
                    }
                }.listRowBackground(Color.gray)
                
            }.animation(nil)
            
        }.cornerRadius(17)
    }
}




//struct PlaceListView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaceListView(landmarks: [Landmark(placemark: MKPlacemark())])
//    }
//}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
