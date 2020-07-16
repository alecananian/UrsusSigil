//
//  Sigil.swift
//  Ursus Sigil
//
//  Created by Daniel Clelland on 10/07/20.
//

import Foundation
import UrsusAtom

public struct Sigil {
    
    public var ship: PatP
    
    public init(ship: PatP) {
        self.ship = ship
    }
    
}

extension Sigil {
    
    public var symbols: [Symbol] {
        return ship.syllables.map { syllable in
            return syllable.symbol
        }
    }
    
}

extension PhoneticBaseSyllable {
    
    public var symbol: Symbol {
        return Symbol.all[self.rawValue]!
    }
    
}
