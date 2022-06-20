//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Simran Preet Narang on 2022-06-19.
//

import Foundation
import MapKit


extension ContentView {

  
  @MainActor
  class ViewModel: ObservableObject {
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0),
                                                          span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @Published private(set) var locations: [Location] = []
    
    @Published var selectedPlace: Location?
    
    func addLocation() {
      let newLocation = Location(id: UUID(),
                                 name: "",
                                 description: "",
                                 latitude: mapRegion.center.latitude,
                                 longitude: mapRegion.center.longitude)
      locations.append(newLocation)
    }
    
    func updateLocation(location: Location, at index: Int) {
      locations[index] = location
    }
  }
}
