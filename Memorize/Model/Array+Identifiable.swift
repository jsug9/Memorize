//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Augusto Galindo Alí on 15/02/21.
//

import Foundation

extension Array where Element: Identifiable {
    func firstindex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
