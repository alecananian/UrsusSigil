//
//  Element.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public protocol Element: Decodable {
    
    var path: UIBezierPath { get }

    var attributes: ElementAttributes { get }
    
}

extension Element {
    
    func render(in context: CGContext) {

//        var stroke: Color
//        var strokeWidth: CGFloat
//        var strokeLineCap: CGLineCap
//        var fill: Color
//        var fillRule: CGPathFillRule
//        var clipRule: CGPathFillRule
//        var transform: String?
        
//        context.saveGState()
//        context.setStrokeColor(UIColor.clear.cgColor)
//        context.setLineWidth(attributes.strokeWidth)
//        context.setLineCap(attributes.strokeLineCap)
//        context.setFillColor(UIColor.clear.cgColor)
//        context.
//
//        context.restoreGState()
    }
    
}
