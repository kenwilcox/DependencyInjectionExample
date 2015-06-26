//
//  MinionService.swift
//  DependencyInjectionExample
//
//  Created by Kenneth Wilcox on 6/25/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation

class MinionService {
  
  enum MinionDataResult {
    case Success([Minion])
    case Failure(NSError)
  }
  
  func getTheMinions(completionHandler: (MinionDataResult) -> Void) {
    println("pretend we're getting minions asynchronously")
    let minionData = [Minion(name: "Bob"), Minion(name: "Dave")]
    completionHandler(MinionDataResult.Success(minionData))
    
    // Uncomment if you want to test our an error scenario
    let error = NSError(domain: "Error",
      code: 400,
      userInfo: [NSLocalizedDescriptionKey : "Oops! The Minions are missing on a new fun adventure!"])
    completionHandler(MinionDataResult.Failure(error))
  }
  
}