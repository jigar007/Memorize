//
//  ArrayExtension.swift
//  Memorize
//
//  Created by Jigar on 29/5/20.
//  Copyright © 2020 Jigar Thakkar. All rights reserved.
//

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil // TODO: Bogus!
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
