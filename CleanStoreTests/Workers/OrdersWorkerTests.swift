//
//  OrdersWorkerTests.swift
//  CleanStore
//
//  Created by Carlos Cortés Sánchez on 13/09/2017.
//  Copyright © 2017 Carlos Cortés Sánchez. All rights reserved.
//

@testable import CleanStore
import XCTest

class OrdersWorkerTests: XCTestCase {
    
    var sut: OrdersWorker!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        setupOrdersWorkers()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func setupOrdersWorkers() {
        sut = OrdersWorker(ordersStore: OrdersMemStoreSpy())
    }
    
    // MARK: Test doubles
    
    class OrdersMemStoreSpy: OrdersMemStore {
        var fetchedOrdersCalled = false
        
        override func fetchOrders(completionHandler: ([Order]) -> Void) {
            fetchedOrdersCalled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            }
        }
    }
    
    //MARK: Tests
    
    func testFetchOrdersShouldReturnListOfOrders() {
        //Given
        let ordersMemStoreSpy = sut.ordersStore as! OrdersMemStoreSpy
        
        //When
        let expect = expectation(description: "Wait for fetchOrders() to return")
        sut.fetchOrders { (orders: [Order]) -> Void in
            expect.fulfill()
        }
        
        //Then
        XCTAssert(ordersMemStoreSpy.fetchedOrdersCalled, "Calling fetchOrders() should ask the data store for a list of orders")
        waitForExpectations(timeout: 1.1)
        XCTAssert(true, "Calling fetchOrders() should result in the completion handler being called with the fetched orders result")
    }
    
}
