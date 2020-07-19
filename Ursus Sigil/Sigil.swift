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
    
    public var color: UIColor
    
    public init(ship: PatP, color: UIColor = .black) {
        self.ship = ship
        self.color = color
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
    
    private static let grids: [Int: [CGRect]] = [
        1: [
            CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5)
        ],
        2: [
            CGRect(x: 0.0, y: 0.25, width: 0.5, height: 0.5),
            CGRect(x: 0.5, y: 0.25, width: 0.5, height: 0.5)
        ],
        4: [
            CGRect(x: 0.0, y: 0.0, width: 0.5, height: 0.5),
            CGRect(x: 0.5, y: 0.0, width: 0.5, height: 0.5),
            CGRect(x: 0.0, y: 0.5, width: 0.5, height: 0.5),
            CGRect(x: 0.5, y: 0.5, width: 0.5, height: 0.5)
        ]
    ]
    
    public func image(with size: CGSize) -> UIImage {
        let symbols = self.symbols
        
        return UIGraphicsImageRenderer(size: size).image { context in
            for (index, cell) in Sigil.grids[symbols.count, default: []].enumerated() {
                let bounds = CGRect(x: size.width * cell.minX, y: size.height * cell.minY, width: size.width * cell.width, height: size.height * cell.height)
                symbols[index].render(into: context.cgContext, bounds: bounds, color: color)
            }
        }
    }
    
}
