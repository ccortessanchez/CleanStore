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
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
