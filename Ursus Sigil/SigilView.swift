//
//  SigilView.swift
//  Alamofire
//
//  Created by Daniel Clelland on 14/07/20.
//

import Foundation
import SwiftUI
import SwiftSVG
import UrsusAtom

public struct SigilView: UIViewRepresentable {
    
    public var ship: PatP
    
    public var backgroundColor: Color
    
    public var foregroundColor: Color
    
    public init(ship: PatP, backgroundColor: Color = Color(UIColor.systemBackground), foregroundColor: Color = Color(UIColor.systemFill)) {
        self.ship = ship
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    public func makeUIView(context: Context) -> UIView {
        return UIView()
//        return UIView(SVGData: Sigil(ship: ship).symbols.first!.svgData()) { layer in
//            layer.boundingBox = CGRect(x: 0.0, y: 0.0, width: 128.0, height: 128.0)
////            layer.resizeToFit(self.view.bounds)
//        }
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}
