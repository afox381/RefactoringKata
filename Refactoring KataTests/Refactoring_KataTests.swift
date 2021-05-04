//
//  Refactoring_KataTests.swift
//  Refactoring KataTests
//
//  Created by Josep Rodriguez on 05/07/2019.
//  Copyright © 2019 Tigerspike. All rights reserved.
//

import XCTest
@testable import Refactoring_Kata

class Refactoring_KataTests: XCTestCase {
    var customer: Customer!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        customer = Customer(name: "Smith")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCustomer() {
        XCTAssert(customer.name == "Smith")
    }
    
    func testRegular0days() {
        add(priceCode: .regular, daysRented: 0)
        let testString = "Rental Record for Smith\n\tTitle\t0.0\nAmount owed is 0.0\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testRegular1day() {
        add(priceCode: .regular, daysRented: 1)
        let testString = "Rental Record for Smith\n\tTitle\t2.0\nAmount owed is 2.0\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testRegular2days() {
        add(priceCode: .regular, daysRented: 2)
        let testString = "Rental Record for Smith\n\tTitle\t2.0\nAmount owed is 2.0\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testRegular3days() {
        add(priceCode: .regular, daysRented: 3)
        let testString = "Rental Record for Smith\n\tTitle\t3.5\nAmount owed is 3.5\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testRegular3daysFrequentRenter() {
        add(priceCode: .regular, daysRented: 1)
        add(priceCode: .regular, daysRented: 1)
        let testString = "Rental Record for Smith\n\tTitle\t2.0\n\tTitle\t2.0\nAmount owed is 4.0\nYou earned 2 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testNewRelease0days() {
        add(priceCode: .newRelease, daysRented: 0)
        let testString = "Rental Record for Smith\n\tTitle\t0.0\nAmount owed is 0.0\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testNewRelease1day() {
        add(priceCode: .newRelease, daysRented: 1)
        let testString = "Rental Record for Smith\n\tTitle\t3.0\nAmount owed is 3.0\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testNewRelease2days() {
        add(priceCode: .newRelease, daysRented: 2)
        let testString = "Rental Record for Smith\n\tTitle\t6.0\nAmount owed is 6.0\nYou earned 2 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testChildren0days() {
        add(priceCode: .childern, daysRented: 0)
        let testString = "Rental Record for Smith\n\tTitle\t0.0\nAmount owed is 0.0\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testChildren1day() {
        add(priceCode: .childern, daysRented: 1)
        let testString = "Rental Record for Smith\n\tTitle\t1.5\nAmount owed is 1.5\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testChildren4days() {
        add(priceCode: .childern, daysRented: 4)
        let testString = "Rental Record for Smith\n\tTitle\t3.0\nAmount owed is 3.0\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testChildren5days() {
        add(priceCode: .childern, daysRented: 5)
        let testString = "Rental Record for Smith\n\tTitle\t4.5\nAmount owed is 4.5\nYou earned 1 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func testOneOfEach() {
        add(priceCode: .regular, daysRented: 1)
        add(priceCode: .newRelease, daysRented: 1)
        add(priceCode: .childern, daysRented: 1)
        let testString = "Rental Record for Smith\n\tTitle\t2.0\n\tTitle\t3.0\n\tTitle\t1.5\nAmount owed is 6.5\nYou earned 3 frequent renter points\n"
        XCTAssert(customer.statement() == testString)
    }
    
    func add(priceCode: Movie.PriceCode, daysRented: Int) {
        let movie = Movie(title: "Title", priceCode: priceCode)
        let rental = Rental(movie: movie, daysRented: daysRented)
        customer.add(rental: rental)
    }
}
