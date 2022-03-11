//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Augusto Galindo Alí on 15/02/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias memoryGameKind = MemoryGame<String>
    
    @Published var memoryGame: memoryGameKind = createMemoryGame()
    
    private static func createMemoryGame() -> memoryGameKind {
        let emojis = ["faraon", "susy", "tapir"]
        return memoryGameKind(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: [memoryGameKind.Card] {
        memoryGame.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: memoryGameKind.Card) {
        memoryGame.choose(card)
    }
    
    func resetGame() {
        memoryGame = EmojiMemoryGame.createMemoryGame()
    }
}
