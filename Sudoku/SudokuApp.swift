//
//  SudokuApp.swift
//
//
//  Created by Charles Prado on 15/02/2023.
//

import SwiftUI
import BacktrackingSolver
import UI
import Models 

@main
struct SudokuApp: App {
    var body: some Scene {
        WindowGroup {
            BoardView(viewModel: .init(data: Game.fakeData()))
        }
    }
}
