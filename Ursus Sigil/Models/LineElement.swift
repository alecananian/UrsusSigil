//
//  LineElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public struct LineElement: Element {
    
    public var x1: CGFloat
    public var y1: CGFloat
    public var x2: CGFloat
    public var y2: CGFloat
    
    public enum CodingKeys: String, CodingKey {

        case x1
        case y1
        case x2
        case y2

    }
    
    public init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.x1 = try CGFloat(container.decodeFromString(Double?.self, forKey: .x1) ?? 0.0)
        self.y1 = try CGFloat(container.decodeFromString(Double?.self, forKey: .y1) ?? 0.0)
        self.x2 = try CGFloat(container.decodeFromString(Double?.self, forKey: .x2) ?? 0.0)
        self.y2 = try CGFloat(container.decodeFromString(Double?.self, forKey: .y2) ?? 0.0)
    }
    
}
