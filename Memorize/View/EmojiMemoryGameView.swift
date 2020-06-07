//
//  ContentView.swift
//  Memorize
//
//  Created by Jigar on 21/5/20.
//  Copyright © 2020 Jigar Thakkar. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.theme.themeName)
                    .font(.title)
                    .frame(alignment: .leading)
                
                Text("Score: \( viewModel.theme.themeName)")
                    .font(.subheadline)
                    .frame(alignment: .trailing)
            }.frame(maxWidth: .infinity)
            
            Grid(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                }
                .padding(5)
            }
            Button(action: viewModel.newGame) {
                Text("New Game")
            }
        }
        .padding()
        .foregroundColor(viewModel.theme.themeColour)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding().opacity(0.4)
                Text(card.content).font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
            .environment(\.colorScheme, .dark)
    }
}
