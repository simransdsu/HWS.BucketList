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

struct Page: Codable {
  let padeId: Int
  let title: String
  let terms: [String: [String]]?
}
