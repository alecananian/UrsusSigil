//
//  Sigil.swift
//  Ursus Sigil
//
//  Created by Daniel Clelland on 10/07/20.
//

import UIKit
import UrsusAtom

public struct Sigil {

    public typealias Ship = PatP
    
    public var ship: Ship
    
    public var color: UIColor
    
    public init(ship: Ship, color: UIColor = .black) {
        self.ship = ship
        self.color = color
    }
    
}

extension Sigil.Ship {
    
    public static var allTitles: Set<Title> = [.galaxy, .star, .planet, .moon, .comet]
    
    public static var sigilTitles: Set<Title> = [.galaxy, .star, .planet]
    
}

extension Sigil {
    
    public func image(with size: CGSize, titles: Set<Ship.Title> = Ship.sigilTitles, icon: Bool = false) -> UIImage {
        let symbols = icon ? self.iconSymbols : self.symbols
        
        return UIGraphicsImageRenderer(size: size).image { context in
            guard titles.contains(ship.title) else {
                return
            }
            
            for (index, cell) in Sigil.grids[ship.title, default: []].enumerated() {
                let bounds = CGRect(x: size.width * cell.minX, y: size.height * cell.minY, width: size.width * cell.width, height: size.height * cell.height)
                symbols[index].render(into: context.cgContext, bounds: bounds, color: color)
            }
        }
    }
    
}

extension Sigil {
    
    private var symbols: [Symbol] {
        return ship.syllables.compactMap { syllable in
            return Symbol.all[syllable.rawValue]
        }
    }
    
    private var iconSymbols: [Symbol] {
        return symbols.compactMap { symbol -> Symbol in
            var mutableSymbol = symbol
            mutableSymbol.children = mutableSymbol.children.filter { $0.element.attributes.dataisgeon }
            return mutableSymbol
        }
    }
    
    private static let grids: [Ship.Title: [CGRect]] = [
        .galaxy: [
            CGRect(x: 0.25, y: 0.25, width: 0.50, height: 0.50)
        ],
        .star: [
            CGRect(x: 0.00, y: 0.25, width: 0.50, height: 0.50),
            CGRect(x: 0.50, y: 0.25, width: 0.50, height: 0.50)
        ],
        .planet: [
            CGRect(x: 0.00, y: 0.00, width: 0.50, height: 0.50),
            CGRect(x: 0.50, y: 0.00, width: 0.50, height: 0.50),
            CGRect(x: 0.00, y: 0.50, width: 0.50, height: 0.50),
            CGRect(x: 0.50, y: 0.50, width: 0.50, height: 0.50)
        ],
        .moon: [
            CGRect(x: 0.00, y: 0.25, width: 0.25, height: 0.25),
            CGRect(x: 0.25, y: 0.25, width: 0.25, height: 0.25),
            CGRect(x: 0.00, y: 0.50, width: 0.25, height: 0.25),
            CGRect(x: 0.25, y: 0.50, width: 0.25, height: 0.25),
            CGRect(x: 0.50, y: 0.25, width: 0.25, height: 0.25),
            CGRect(x: 0.75, y: 0.25, width: 0.25, height: 0.25),
            CGRect(x: 0.50, y: 0.50, width: 0.25, height: 0.25),
            CGRect(x: 0.75, y: 0.50, width: 0.25, height: 0.25),
        ],
        .comet: [
            CGRect(x: 0.00, y: 0.00, width: 0.25, height: 0.25),
            CGRect(x: 0.25, y: 0.00, width: 0.25, height: 0.25),
            CGRect(x: 0.00, y: 0.25, width: 0.25, height: 0.25),
            CGRect(x: 0.25, y: 0.25, width: 0.25, height: 0.25),
            CGRect(x: 0.50, y: 0.00, width: 0.25, height: 0.25),
            CGRect(x: 0.75, y: 0.00, width: 0.25, height: 0.25),
            CGRect(x: 0.50, y: 0.25, width: 0.25, height: 0.25),
            CGRect(x: 0.75, y: 0.25, width: 0.25, height: 0.25),
            CGRect(x: 0.00, y: 0.50, width: 0.25, height: 0.25),
            CGRect(x: 0.25, y: 0.50, width: 0.25, height: 0.25),
            CGRect(x: 0.00, y: 0.75, width: 0.25, height: 0.25),
            CGRect(x: 0.25, y: 0.75, width: 0.25, height: 0.25),
            CGRect(x: 0.50, y: 0.50, width: 0.25, height: 0.25),
            CGRect(x: 0.75, y: 0.50, width: 0.25, height: 0.25),
            CGRect(x: 0.50, y: 0.75, width: 0.25, height: 0.25),
            CGRect(x: 0.75, y: 0.75, width: 0.25, height: 0.25)
        ]
    ]
    
}
