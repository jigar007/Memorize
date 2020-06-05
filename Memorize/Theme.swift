//
//  Theme.swift
//  Memorize
//
//  Created by Jigar on 5/6/20.
//  Copyright © 2020 Jigar Thakkar. All rights reserved.
//

import SwiftUI

struct EmojiThemes {
    
    typealias Emoji = String
    
    private var themes: [Theme<Emoji>]
    
    func pickRandomTheme() -> Theme<Emoji> {
        themes.randomElement()!
    }
    
    init() {
        themes = [Theme]()
        
        let animals = ["🐼","🐔","🦄"]
        let sports = ["🏀","🏈","⚾","🎾"]
        let halloween = ["👻","🎃","🕷","🦠","🕸"]
        let faces = ["😀","😉","😢","😒"]
        let flags = ["🇮🇳","🇦🇺","🇮🇱","🇷🇺","🇫🇷","🇨🇦"]
        let vehicles = ["✈️","🚁","🛸","🚲"]
        
        themes.append(Theme(themeName: "Animals", emojis: animals, themeColour: Color.red))
        themes.append(Theme(themeName: "Sports", emojis: sports, themeColour: Color.blue))
        themes.append(Theme(themeName: "Halloween", emojis: halloween, numberOfPairOfCardsToShow: 5, themeColour: Color.orange))
        themes.append(Theme(themeName: "Faces", emojis: faces, themeColour: Color.yellow))
        themes.append(Theme(themeName: "Flags", emojis: flags, themeColour: Color.purple))
        themes.append(Theme(themeName: "Vehicles", emojis: vehicles, themeColour: Color.green))
    }
}

struct Theme<CardContent> {
    let themeName: String
    let emojis: [CardContent]
    let numberOfPairOfCardsToShow: Int?
    let themeColour: Color
    
    internal init(themeName: String,
                  emojis: [CardContent],
                  numberOfPairOfCardsToShow: Int? = nil,
                  themeColour: Color) {
        self.themeName = themeName
        self.emojis = emojis
        self.numberOfPairOfCardsToShow = numberOfPairOfCardsToShow
        self.themeColour = themeColour
    }
}
