//
//  Cardify.swift
//  Memorize
//
//  Created by Augusto Galindo Alí on 16/02/21.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp : Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue }
    }
    
    private let rectangle = RoundedRectangle(cornerRadius: 10.0)
    private let edgeLineWidth: CGFloat = 3
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                rectangle
                    .stroke(lineWidth: edgeLineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            rectangle.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
