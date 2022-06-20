//
//  Result.swift
//  BucketList
//
//  Created by Simran Preet Narang on 2022-06-19.
//

import Foundation

struct Result: Codable {
  let query: Query
}

struct Query: Codable {
  let pages: [Int: Page]
}

struct Page: Codable, Comparable {
  let padeid: Int?
  let title: String
  let terms: [String: [String]]?
  
  var description: String {
    return terms?["description"]?.first ?? "No futher information"
  }
  
  static func <(lhs: Page, rhs: Page) -> Bool {
    lhs.title < rhs.title
  }
}
