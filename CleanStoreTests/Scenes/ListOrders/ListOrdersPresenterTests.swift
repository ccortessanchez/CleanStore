//
//  ListOrdersPresenterTests.swift
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

class ListOrdersPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: ListOrdersPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupListOrdersPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupListOrdersPresenter()
  {
    sut = ListOrdersPresenter()
  }
  
  // MARK: Test doubles
  
  class ListOrdersDisplayLogicSpy: ListOrdersDisplayLogic
  {
    var displaySomethingCalled = false
    /**
    func displaySomething(viewModel: ListOrders.Something.ViewModel)
    {
      displaySomethingCalled = true
    }
    **/
  }
  
  // MARK: Tests
  
  func testPresentSomething()
  {
    // Given
    //let spy = ListOrdersDisplayLogicSpy()
    //sut.viewController = spy
    //let response = ListOrders.Something.Response()
    
    // When
    //sut.presentSomething(response: response)
    
    // Then
    //XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}
