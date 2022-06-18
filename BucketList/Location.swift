//
//  Location.swift
//  BucketList
//
//  Created by Simran Preet Narang on 2022-06-18.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
  let id: UUID
  var name: String
  var description: String
  let latitude: Double
  let longitude: Double
}
