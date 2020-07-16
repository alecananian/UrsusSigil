//
//  CircleElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public struct CircleElement: Element {
    
    @DecodableFromString public var cx: Double
    @DecodableFromString public var cy: Double
    @DecodableFromString public var r: Double
    
    public enum CodingKeys: String, CodingKey {

        case cx
        case cy
        case r

    }
    
}
