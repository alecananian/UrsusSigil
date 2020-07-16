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
    
    public var foregroundColor: UIColor
    
    public var backgroundColor: UIColor
    
    public init(ship: PatP, foregroundColor: UIColor = .black, backgroundColor: UIColor = .white) {
        self.ship = ship
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    
}

extension Sigil {
    
    internal var symbols: [Symbol] {
        return ship.syllables.compactMap { syllable in
            return Symbol.all[syllable.rawValue]
        }
    }
    
}

extension Sigil {
    
    public func image(with size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { context in
            context.cgContext.setFillColor(backgroundColor.cgColor)
            context.cgContext.fill(CGRect(origin: .zero, size: size))
            
            symbols.first?.render(into: context.cgContext, bounds: CGRect(origin: .zero, size: size), foregroundColor: foregroundColor, backgroundColor: backgroundColor)
        }
    }
    
}
