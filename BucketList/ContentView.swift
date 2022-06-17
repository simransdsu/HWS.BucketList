//
//  ContentView.swift
//  BucketList
//
//  Created by Simran Preet Narang on 2022-06-17.
//

import SwiftUI
import MapKit


struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


struct ContentView: View {
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Tower of London", coordinate:  CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)),
        Location(name: "Buckingham Place", coordinate:  CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141))
    ]
    
    var body: some View {
        Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
//            MapMarker(coordinate: location.coordinate)
            
            // Custom Markers
            MapAnnotation(coordinate: location.coordinate) {
                Circle()
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
