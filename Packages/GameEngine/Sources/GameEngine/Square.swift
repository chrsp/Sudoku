//
//  Square.swift
//
//
//  Created by Charles Prado on 21/02/2023.
//

import Foundation

public class Square {
    public var value: Int
    public let row: Int
    public let column: Int
    public let block: Int
    public let isPermanent: Bool

    public init(value: Int, row: Int = 0, column: Int = 0, block: Int = 0, isPermanent: Bool = true) {
        self.value = value
        self.row = row
        self.column = column
        self.block = block
        self.isPermanent = isPermanent
    }
}

extension Square: Identifiable {
    public static func == (lhs: Square, rhs: Square) -> Bool {
        lhs.value == rhs.value && lhs.row == rhs.row && lhs.column == rhs.column
    }
}

extension Square: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(row)
        hasher.combine(column)
    }
}
