//
//  Order.swift
//  CleanStore
//
//  Created by Carlos Cortés Sánchez on 12/09/2017.
//  Copyright © 2017 Carlos Cortés Sánchez. All rights reserved.
//

import Foundation

struct Order {
    // MARK: Contact info
    var firstName: String
    var lastName: String
    var email: String
    
    // MARK: Misc
    var id: String?
    var date: Date
    var total: NSDecimalNumber
}
