//
//  SigilView.swift
//  Alamofire
//
//  Created by Daniel Clelland on 14/07/20.
//

import Foundation
import SwiftUI
import UrsusAtom

public struct SigilView: UIViewRepresentable {
    
    public var ship: PatP
    
    public var foregroundColor: UIColor = .black
    
    public var backgroundColor: UIColor = .white
    
    public init(ship: PatP, foregroundColor: UIColor = .black, backgroundColor: UIColor = .white) {
        self.ship = ship
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    public func makeUIView(context: Context) -> UIView {
        #warning("Set image view scaling mode")
        #warning("Move image generation off into the sigil struct")
        return UIImageView(
            image: UIGraphicsImageRenderer(size: CGSize(width: 128.0, height: 128.0)).image { context in
                Sigil(ship: ship).symbols.first!.render(in: context.cgContext, foregroundColor: foregroundColor, backgroundColor: backgroundColor)
            }
        )
    }
    
    public func updateUIView(_ uiView: UIView, context: Context) {
        (uiView as? UIImageView)?.image = UIGraphicsImageRenderer(size: CGSize(width: 128.0, height: 128.0)).image { context in
            Sigil(ship: ship).symbols.first!.render(in: context.cgContext, foregroundColor: foregroundColor, backgroundColor: backgroundColor)
        }
    }
    
}
