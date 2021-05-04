//
//  RentalRecordProducerType.swift
//  Refactoring Kata
//
//  Created by Andrew Fox on 01/03/2021.
//  Copyright © 2021 Tigerspike. All rights reserved.
//

import Foundation

protocol RentalRecordProducerType {
    func rentalRecord(for name: String, rentals: [Rental]) -> String
}
