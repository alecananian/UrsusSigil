//
//  LineElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public struct LineElement: Element {
    
    @OptionalDecodableFromString public var x1: Double?
    @OptionalDecodableFromString public var y1: Double?
    @DecodableFromString public var x2: Double
    @DecodableFromString public var y2: Double
    
}
