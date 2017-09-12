//
//  ListOrdersInteractorTests.swift
//  CleanStore
//
//  Created by Carlos Cortés Sánchez on 12/09/2017.
//  Copyright (c) 2017 Carlos Cortés Sánchez. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import CleanStore
import XCTest

class ListOrdersInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: ListOrdersInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupListOrdersInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupListOrdersInteractor()
  {
    sut = ListOrdersInteractor()
  }
  
  // MARK: Test doubles
  
  class ListOrdersPresentationLogicSpy: ListOrdersPresentationLogic
  {
    var presentSomethingCalled = false
    
    func presentSomething(response: ListOrders.Something.Response)
    {
      presentSomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testDoSomething()
  {
    // Given
    let spy = ListOrdersPresentationLogicSpy()
    sut.presenter = spy
    let request = ListOrders.Something.Request()
    
    // When
    sut.doSomething(request: request)
    
    // Then
    XCTAssertTrue(spy.presentSomethingCalled, "doSomething(request:) should ask the presenter to format the result")
  }
}
