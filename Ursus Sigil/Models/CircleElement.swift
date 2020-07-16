//
//  CircleElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public class CircleElement: Element {
    
    public var cx: CGFloat
    public var cy: CGFloat
    public var r: CGFloat
    
    public enum CodingKeys: String, CodingKey {

        case cx
        case cy
        case r

    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cx = try container.decodeIfPresent(String.self, forKey: .cx).flatMap { Double($0) }.flatMap { CGFloat($0) } ?? 0.0
        self.cy = try container.decodeIfPresent(String.self, forKey: .cy).flatMap { Double($0) }.flatMap { CGFloat($0) } ?? 0.0
        self.r = try container.decodeIfPresent(String.self, forKey: .r).flatMap { Double($0) }.flatMap { CGFloat($0) } ?? 0.0
        try super.init(from: decoder)
    }
    
}
