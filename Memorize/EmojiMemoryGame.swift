//
//  MemoryGameEmoji.swift
//  Memorize
//
//  Created by Jigar on 22/5/20.
//  Copyright © 2020 Jigar Thakkar. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","🦠","🕸"]
        return MemoryGame<String>(numberOfPairsOfCard: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
