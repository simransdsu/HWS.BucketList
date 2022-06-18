//
//  ContentView.swift
//  BucketList
//
//  Created by Simran Preet Narang on 2022-06-17.
//

import SwiftUI
import MapKit

struct ContentView: View {
  
  @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0),
                                                    span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
  @State private var locations: [Location] = []
  
  var body: some View {
    ZStack {
      Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
        MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
      }
        .ignoresSafeArea()
      
      Circle()
        .fill(.blue)
        .opacity(0.3)
        .frame(width: 32, height: 32)
      
      floatingAddButton
    }
  }
  
  private var floatingAddButton: some View {
    VStack {
      Spacer()
      HStack {
        Spacer()
        Button {
          let newLocation = Location(id: UUID(),
                                     name: "new Location",
                                     description: "",
                                     latitude: mapRegion.center.latitude,
                                     longitude: mapRegion.center.longitude)
          locations.append(newLocation)
        } label: {
          Image(systemName: "plus")
            .padding()
            .background(.black.opacity(0.75))
            .foregroundColor(.white)
            .font(.title)
            .clipShape(Circle())
            .padding()
        }
      }
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
