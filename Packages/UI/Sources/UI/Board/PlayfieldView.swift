//
//  PlayfieldView.swift
//  
//
//  Created by Charles Prado on 21/02/2023.
//

import SwiftUI

struct PlayfieldView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 40) {
                Spacer(minLength: 40)
                horizontalLine(0.4)
                horizontalLine(0.4)
                horizontalLine(0.8)
                horizontalLine(0.4)
                horizontalLine(0.4)
                horizontalLine(0.8)
                horizontalLine(0.4)
                horizontalLine(0.4)
                Spacer(minLength: 40)
            }
            HStack(spacing: 40) {
                Spacer(minLength: 40)
                verticalLine(0.4)
                verticalLine(0.4)
                verticalLine(0.8)
                verticalLine(0.4)
                verticalLine(0.4)
                verticalLine(0.8)
                verticalLine(0.4)
                verticalLine(0.4)
                Spacer(minLength: 40)
            }
        }
    }
    
    private func horizontalLine(_ opacity: CGFloat = 0.5) -> some View {
        Color.black.opacity(opacity).frame(width: 360, height: opacity)
    }
    
    private func verticalLine(_ opacity: CGFloat = 0.5) -> some View {
        Color.black.opacity(opacity).frame(width: opacity, height: 360)
    }
}
