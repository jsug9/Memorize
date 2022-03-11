//
//  CardView.swift
//  Memorize
//
//  Created by Augusto Galindo Alí on 15/02/21.
//

import SwiftUI

struct CardView: View {
    typealias MemoryGameKind = MemoryGame<String>
    
    var card: MemoryGameKind.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack  {
                    Group {
                        if card.isConsumingBonusTime {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining*360-90), clockwise: true)
                                .onAppear { startBonusTimeAnimation() }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                        }
                    }
                    .padding(5)
                    .opacity(0.35)
                    .transition(.identity)
                    CircleImage(image: card.content, width: geometry.size.width * 0.7, height: geometry.size.height * 0.7)
                        .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(AnyTransition.scale)
            }
        }
    }
    
    // MARK: - Drawing Constant
    
    private let rectangle = RoundedRectangle(cornerRadius: 10.0)
    private let edgeLineWidth: CGFloat = 3
    
    private func fontSize(for size: CGSize) -> CGFloat {
        let fontScaleFactor: CGFloat = 0.7
        return min(size.width, size.height) * fontScaleFactor
    }
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
}
