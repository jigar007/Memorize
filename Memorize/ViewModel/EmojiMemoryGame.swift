//
//  MemoryGameEmoji.swift
//  Memorize
//
//  Created by Jigar on 22/5/20.
//  Copyright © 2020 Jigar Thakkar. All rights reserved.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    typealias Emoji = String
    
    @Published private var model: MemoryGame<Emoji> = EmojiMemoryGame.createMemoryGame()
        
    private static func createMemoryGame() -> MemoryGame<Emoji> {
            
        let theme: Theme<Emoji> = EmojiThemes().pickRandomTheme()
        
        let numberOfPairsOfCard = theme.numberOfPairOfCardsToShow ?? Int.random(in: 2...theme.emojis.count)
        return MemoryGame<Emoji>(theme: theme, numberOfPairsOfCard: numberOfPairsOfCard) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<Emoji>.Card] {
        model.cards
    }
    
    var theme: Theme<Emoji> {
        model.theme
    }
        
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<Emoji>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
