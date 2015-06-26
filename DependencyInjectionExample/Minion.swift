//
//  Minion.swift
//  DependencyInjectionExample
//
//  Created by Kenneth Wilcox on 6/25/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

struct Minion {
  let name: String
}

// This is weird - need to read up on this one
extension Minion: Equatable {}
  func == (lhs: Minion, rhs: Minion) -> Bool {
    return lhs.name == rhs.name
  }
