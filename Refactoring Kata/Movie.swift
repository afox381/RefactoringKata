//
//  Movie.swift
//  Refactoring Kata
//
//  Created by Josep Rodriguez on 05/07/2019.
//  Copyright © 2019 Tigerspike. All rights reserved.
//

import Foundation

public struct Movie {
    public enum PriceCode {
        case regular
        case newRelease
        case childern
    }

    public let title: String
    public let priceCode: PriceCode
}
