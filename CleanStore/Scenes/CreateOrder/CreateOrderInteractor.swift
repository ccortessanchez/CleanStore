//
//  CreateOrderInteractor.swift
//  CleanStore
//
//  Created by Carlos Cortés Sánchez on 11/09/2017.
//  Copyright (c) 2017 Carlos Cortés Sánchez. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CreateOrderBusinessLogic
{
    func formatExpirationDate(request: CreateOrder.FormatExpirationDate.Request)
    var shippingMethods: [String] { get }
}

protocol CreateOrderDataStore
{
    //var name: String { get set }
    var shippingMethods: [String] { get }
}

class CreateOrderInteractor: CreateOrderBusinessLogic, CreateOrderDataStore
{
    var presenter: CreateOrderPresentationLogic?
    var worker: CreateOrderWorker?
    //var name: String = ""
    var shippingMethods = [
        "Standard Shipping",
        "Two-Day Shipping ",
        "One-Day Shipping "
    ]
    
    // MARK: Do something
    func formatExpirationDate(request: CreateOrder.FormatExpirationDate.Request) {
        let response = CreateOrder.FormatExpirationDate.Response(date: request.date)
        presenter?.presentExpirationDate(response: response)
    }
}
