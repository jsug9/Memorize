//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Augusto Galindo Alí on 15/02/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.75)) {
                            viewModel.choose(card: card)
                        }
                    }
                .padding(5)
            }
            .padding()
            .foregroundColor(.orange)
            
            Button(action: {
                withAnimation(.easeInOut) {
                    self.viewModel.resetGame()
                }
            }, label: {
                Text("New Game").padding(.bottom)
            })
        }
    }
    
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
