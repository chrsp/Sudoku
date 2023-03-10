//
//  Square.swift
// 
//
//  Created by Charles Prado on 15/02/2023.
//

import SwiftUI
import GameEngine

struct SquareView: View {
    @ObservedObject var viewModel: SquareViewModel

    var body: some View {
        Text(viewModel.squareText)
            .frame(width: 40, height: 40, alignment: .center)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        let square = Square(value: 1)
        let viewModel = SquareViewModel(square: square)
        SquareView(viewModel: viewModel)
    }
}
