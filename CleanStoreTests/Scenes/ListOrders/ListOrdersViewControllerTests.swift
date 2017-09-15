//
//  ListOrdersViewControllerTests.swift
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

class ListOrdersViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: ListOrdersViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupListOrdersViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupListOrdersViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "ListOrdersViewController") as! ListOrdersViewController
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class ListOrdersBusinessLogicSpy: ListOrdersBusinessLogic
    {
        var fetchOrdersCalled = false
        
        func fetchOrders(request: ListOrders.FetchOrders.Request)
        {
            fetchOrdersCalled = true
        }
    }
    
    class TableViewSpy: UITableView {
        
        var reloadDataCalled = false
        
        override func reloadData() {
            reloadDataCalled = true
        }
    }
    
    // MARK: Tests
    
    func testShouldFetchOrdersWhenViewIsLoaded()
    {
        // Given
        let listOrdersBussinessLogicSpy = ListOrdersBusinessLogicSpy()
        sut.interactor = listOrdersBussinessLogicSpy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(listOrdersBussinessLogicSpy.fetchOrdersCalled, "Should fetch orders when the view is loaded")
    }
    
    func testShouldDisplayFetchedOrders()
    {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy
        let displayedOrders = [ListOrders.FetchOrders.ViewModel.DisplayedOrder(id: "abc123", date: "6/29/07", email: "amy.apple@clean-swift.com", name: "Amy Apple", total: "$1.23")]
        let viewModel = ListOrders.FetchOrders.ViewModel(displayedOrders: displayedOrders)
        
        // When
        sut.displayFetchedOrders(viewModel: viewModel)
        
        // Then
        XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched orders should reload the table view")
    }
    
    func testNumbersOfSectionsInTableViewShouldAlwaysBeOne() {
        // Given
        let tableView = sut.tableView
        
        // When
        let numberOfSections = sut.numberOfSections(in: tableView!)
        
        // Then
        XCTAssertEqual(numberOfSections, 1, "The number of table view sections should always be 1")
    }
}
