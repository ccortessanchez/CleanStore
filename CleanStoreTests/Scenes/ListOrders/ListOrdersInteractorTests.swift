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
        var presentFetchedOrdersCalled = false
        
        func presentFetchedOrders(response: ListOrders.FetchOrders.Response)
        {
            presentFetchedOrdersCalled = true
        }
    }
    
    class OrdersWorkerSpy: OrdersWorker
    {
        var fetchOrdersCalled = false
        
        override func fetchOrders(completionHandler: ([Order]) -> Void) {
            fetchOrdersCalled = true
            completionHandler([])
        }
    }
    
    // MARK: Tests
    
    func testFetchOrdersShouldAskOrdersWorkerToFetchOrdersAndPresenterToFormatResult()
    {
        // Given
        let listOrdersPresentationLogicSpy = ListOrdersPresentationLogicSpy()
        sut.presenter = listOrdersPresentationLogicSpy
        let ordersWorkerSpy = OrdersWorkerSpy(ordersStore: OrdersMemStore())
        sut.ordersWorker = ordersWorkerSpy
        let request = ListOrders.FetchOrders.Request()
        
        // When
        sut.fetchOrders(request: request)
        
        // Then
        XCTAssert(ordersWorkerSpy.fetchOrdersCalled, "FetchOrders() should ask OrdersWorker to fetch orders")
        XCTAssert(listOrdersPresentationLogicSpy.presentFetchedOrdersCalled, "FetchOrders() should ask presenter to format orders result")
    }
}
