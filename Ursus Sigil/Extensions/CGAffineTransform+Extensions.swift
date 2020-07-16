//
//  CGAffineTransform+Extensions.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

extension CGAffineTransform {
    
    internal init(from source: CGRect, to destination: CGRect) {
        guard source.width.isNormal, source.height.isNormal else {
            self = .identity
            return
        }
        
        self = CGAffineTransform(
            a: destination.width / source.width,
            b: 0.0,
            c: 0.0,
            d: destination.height / -source.height,
            tx: (destination.minX * source.width - source.minX * destination.width) / source.width,
            ty: (destination.minY * -source.height - source.maxY * destination.height) / -source.height
        )
    }
    
}
