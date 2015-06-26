//
//  DependencyInjectionExampleTests.swift
//  DependencyInjectionExampleTests
//
//  Created by Kenneth Wilcox on 6/25/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import XCTest

class DependencyInjectionExampleTests: XCTestCase {
  
  var viewController: ViewController!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    let storyboard = UIStoryboard(name: "Main",
      bundle: NSBundle(forClass: self.dynamicType))
    let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
    viewController = navigationController.topViewController as! ViewController
    
    UIApplication.sharedApplication().keyWindow!.rootViewController = navigationController
    NSRunLoop.mainRunLoop().runUntilDate(NSDate())
    
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // This is an example of a functional test case.
    XCTAssert(true, "Pass")
  }
  
  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measureBlock() {
      // Put the code you want to measure the time of here.
    }
  }
  
  func testFetchMinions() {
    println("testFetchMinions")
    let fakeMinionService = FakeMinionService()
    viewController.fetchMinions(minionService: fakeMinionService)
    
    XCTAssertTrue(fakeMinionService.getTheMinionsWasCalled)
    
    if let dataSource = viewController.dataSource {
      XCTAssertEqual(fakeMinionService.result, dataSource)
    } else {
      XCTFail("Data Source should not be nil!!!")
    }
  }
  
}
