//
//  SquareViewModel.swift
//  Sudoku
//
//  Created by Charles Prado on 20/02/2023.
//

import Foundation
import Models

class SquareViewModel: ObservableObject {
    @Published private var square: Square

    var isEmptySquare: Bool {
        square.value == 0
    }

    var squareText: String {
        isEmptySquare ? " " : "\(square.value)"
    }

    init(square: Square) {
        self.square = square
    }
}
