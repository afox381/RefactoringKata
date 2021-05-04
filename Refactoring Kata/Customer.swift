//
//  Customer.swift
//  Refactoring Kata
//
//  Created by Josep Rodriguez on 05/07/2019.
//  Copyright © 2019 Tigerspike. All rights reserved.
//

import Foundation

public final class Customer {
    public let name: String
    
    private(set) var rentals: [Rental] = []
    private let rentalRecordProducer: RentalRecordProducerType

    init(name: String, rentalRecordProducer: RentalRecordProducerType = SimpleRentalRecordProducer()) {
        self.name = name
        self.rentalRecordProducer = rentalRecordProducer
    }

    public func add(rental: Rental) {
        rentals.append(rental)
    }
    
    public func statement() -> String {
        rentalRecordProducer.rentalRecord(for: name, rentals: rentals)
    }
}
