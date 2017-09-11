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
  func doSomething(request: CreateOrder.Something.Request)
}

protocol CreateOrderDataStore
{
  //var name: String { get set }
}

class CreateOrderInteractor: CreateOrderBusinessLogic, CreateOrderDataStore
{
  var presenter: CreateOrderPresentationLogic?
  var worker: CreateOrderWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: CreateOrder.Something.Request)
  {
    worker = CreateOrderWorker()
    worker?.doSomeWork()
    
    let response = CreateOrder.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
