//
//  CircleElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public struct CircleElement: Element {
    
    public var cx: CGFloat
    public var cy: CGFloat
    public var r: CGFloat
    
    public enum CodingKeys: String, CodingKey {

        case cx
        case cy
        case r

    }
    
    public init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cx = try CGFloat(container.decodeFromString(Double?.self, forKey: .cx) ?? 0.0)
        self.cy = try CGFloat(container.decodeFromString(Double?.self, forKey: .cy) ?? 0.0)
        self.r = try CGFloat(container.decodeFromString(Double?.self, forKey: .r) ?? 0.0)
    }
    
}
