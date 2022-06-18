//
//  Location.swift
//  BucketList
//
//  Created by Simran Preet Narang on 2022-06-18.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Codable, Equatable {
  let id: UUID
  var name: String
  var description: String
  let latitude: Double
  let longitude: Double
  
  var coordinate: CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
  
  static func ==(lhs: Location, rhs: Location) -> Bool {
    return lhs.id == rhs.id
  }
  
  static let example = Location(id: UUID(),
                                name: "Buckingham Place",
                                description: "Where Queen Elizabeth lives with her dohis",
                                latitude: 51.501,
                                longitude: -0.141)
}
