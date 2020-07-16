//
//  RectElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public class RectElement: Element {
    
    public var width: CGFloat
    public var height: CGFloat
    
    public enum CodingKeys: String, CodingKey {

        case width
        case height

    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.width = try container.decodeIfPresent(String.self, forKey: .width).flatMap { Double($0) }.flatMap { CGFloat($0) } ?? 0.0
        self.height = try container.decodeIfPresent(String.self, forKey: .height).flatMap { Double($0) }.flatMap { CGFloat($0) } ?? 0.0
        try super.init(from: decoder)
    }
    
}
