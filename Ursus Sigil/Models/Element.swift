//
//  Element.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

internal protocol Element: Decodable {
    
    var path: UIBezierPath { get }

    var attributes: ElementAttributes { get }
    
}

private let symbolBounds = CGRect(x: 0.0, y: 0.0, width: 128.0, height: 128.0)

extension Element {
    
    func render(into context: CGContext, bounds: CGRect, foregroundColor: UIColor, backgroundColor: UIColor) {
        context.saveGState()
        context.setStrokeColor(attributes.stroke.color(foregroundColor: foregroundColor, backgroundColor: backgroundColor).cgColor)
        context.setLineWidth(attributes.strokeWidth)
        context.setLineCap(attributes.strokeLineCap)
        context.setFillColor(attributes.fill.color(foregroundColor: foregroundColor, backgroundColor: backgroundColor).cgColor)
        context.addPath(path.applying(attributes.transform).applying(CGAffineTransform(from: symbolBounds, to: bounds)).cgPath)
//        context.clip(using: attributes.clipRule)
        context.fillPath(using: attributes.fillRule)
        context.strokePath()
        context.restoreGState()
    }
    
}
