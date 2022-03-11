//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Augusto Galindo Alí on 15/02/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
