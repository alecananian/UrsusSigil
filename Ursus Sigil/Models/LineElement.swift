//
//  LineElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public class LineElement: Element {
    
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
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.x1 = try container.decodeIfPresent(String.self, forKey: .x1).flatMap { Double($0) }.flatMap { CGFloat($0) } ?? 0.0
        self.y1 = try container.decodeIfPresent(String.self, forKey: .y1).flatMap { Double($0) }.flatMap { CGFloat($0) } ?? 0.0
        self.x2 = try container.decodeIfPresent(String.self, forKey: .x2).flatMap { Double($0) }.flatMap { CGFloat($0) } ?? 0.0
        self.y2 = try container.decodeIfPresent(String.self, forKey: .y2).flatMap { Double($0) }.flatMap { CGFloat($0) } ?? 0.0
        try super.init(from: decoder)
    }
    
}
