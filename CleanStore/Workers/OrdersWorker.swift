//
//  OrdersWorker.swift
//  CleanStore
//
//  Created by Carlos Cortés Sánchez on 12/09/2017.
//  Copyright © 2017 Carlos Cortés Sánchez. All rights reserved.
//

import Foundation

protocol OrdersStoreProtocol {
    func fetchOrders(completionHandler: ([Order]) -> Void)
}


class OrdersWorker {
    
    var ordersStore: OrdersStoreProtocol
    
    init(ordersStore: OrdersStoreProtocol) {
        self.ordersStore = ordersStore
    }
    
    func fetchOrders(completionHandler: ([Order]) -> Void) {
        ordersStore.fetchOrders { (orders: [Order]) -> Void in
            completionHandler(orders)
        }
    }
}
