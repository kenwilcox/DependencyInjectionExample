//
//  FakeMinionService.swift
//  DependencyInjectionExample
//
//  Created by Kenneth Wilcox on 6/25/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation

class FakeMinionService: MinionService {
  var getTheMinionsWasCalled = false
  var result = [Minion(name: "Bob"), Minion(name: "Dave")]
  
  override func getTheMinions(completionHandler: (MinionDataResult) -> Void) {
    getTheMinionsWasCalled = true
    completionHandler(MinionDataResult.Success(result))
  }
}