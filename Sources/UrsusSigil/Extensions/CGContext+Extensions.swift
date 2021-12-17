//
//  CGContext+Extensions.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation
import CoreGraphics

extension CGContext {
    
    internal func draw(_ actions: (CGContext) -> Void) {
        saveGState()
        actions(self)
        restoreGState()
    }
    
}
