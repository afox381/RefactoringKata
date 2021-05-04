//
//  SimpleRentalRecordProducer.swift
//  Refactoring Kata
//
//  Created by Andrew Fox on 01/03/2021.
//  Copyright © 2021 Tigerspike. All rights reserved.
//

import Foundation

struct SimpleRentalRecordProducer: RentalRecordProducerType {
    func rentalRecord(for name: String, rentals: [Rental]) -> String {
        var totalAmount: Double = 0
        var frequentRenterPoints: Int = 0
        var record: String = header(for: name)

        for item in rentals {
            frequentRenterPoints += item.movie.priceCode.frequentRenterPoints(for: item.daysRented)
            
            let thisAmount: Double = item.movie.priceCode.cost(for: item.daysRented)
            
            record += lineItem(for: item.movie.title, amount: thisAmount)
            totalAmount += thisAmount
        }

        record += footer(for: totalAmount, renterPoints: frequentRenterPoints)

        return record
    }
    
    private func header(for name: String) -> String {
        "Rental Record for \(name)\n"
    }
    
    private func lineItem(for title: String, amount: Double) -> String {
        "\t\(title)\t\(amount)\n"
    }
    
    private func footer(for amount: Double, renterPoints: Int) -> String {
        "Amount owed is \(amount)\nYou earned \(renterPoints) frequent renter points\n"
    }
}

extension Movie.PriceCode {
    func cost(for daysRented: Int) -> Double {
        guard daysRented > 0 else { return 0 }
        
        var thisAmount: Double = 0
        switch self {
        case .regular:
            thisAmount += 2
            if (daysRented > 2) {
                thisAmount += Double(daysRented - 2) * 1.5
            }

        case .newRelease:
            thisAmount += Double(daysRented) * 3

        case .childern:
            thisAmount += 1.5
            if (daysRented > 3) {
                thisAmount += Double(daysRented - 3) * 1.5
            }
        }
        
        return thisAmount
    }
    
    func frequentRenterPoints(for daysRented: Int) -> Int {
        switch self {
        case .regular:
            return 1
        case .newRelease:
            // add bonus for a two day new release rental
            return daysRented > 1 ? 2 : 1
        case .childern:
            return 1
        }
    }
}
