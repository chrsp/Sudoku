//
//  SudokuApp.swift
//  Sudoku
//
//  Created by Charles Prado on 15/02/2023.
//

import SwiftUI
import BacktrackingSolver

@main
struct SudokuApp: App {
    var body: some Scene {
        WindowGroup {
            BoardView(viewModel: .init(data: BoardViewModel.fakeData()))
        }
    }
}
