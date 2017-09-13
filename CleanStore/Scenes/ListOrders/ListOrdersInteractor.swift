//
//  ListOrdersInteractor.swift
//  CleanStore
//
//  Created by Carlos Cortés Sánchez on 12/09/2017.
//  Copyright (c) 2017 Carlos Cortés Sánchez. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListOrdersBusinessLogic
{
    //func doSomething(request: ListOrders.Something.Request)
    func fetchOrders(request: ListOrders.FetchOrders.Request)
}

protocol ListOrdersDataStore
{
    var orders: [Order]? { get }
}

class ListOrdersInteractor: ListOrdersBusinessLogic, ListOrdersDataStore
{

    var presenter: ListOrdersPresentationLogic?
    var ordersWorker = OrdersWorker(ordersStore: OrdersMemStore())
    var worker: ListOrdersWorker?
    
    var orders: [Order]?
    
    // MARK: Fetch orders
    
    func fetchOrders(request: ListOrders.FetchOrders.Request) {
        ordersWorker.fetchOrders { (orders) -> Void in
            self.orders = orders
            let response = ListOrders.FetchOrders.Response(orders: orders)
            self.presenter?.presentFetchedOrders(response: response)
        }
    }
}
