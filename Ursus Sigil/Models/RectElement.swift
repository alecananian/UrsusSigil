//
//  RectElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public struct RectElement: Element {
    
    public var width: CGFloat
    public var height: CGFloat
    
    public enum CodingKeys: String, CodingKey {

        case width
        case height

    }
    
    public init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.width = try CGFloat(container.decodeFromString(Double?.self, forKey: .width) ?? 0.0)
        self.height = try CGFloat(container.decodeFromString(Double?.self, forKey: .height) ?? 0.0)
    }
    
}
