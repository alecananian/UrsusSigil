//
//  RectElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public struct RectElement: Element {
    
    public var path: UIBezierPath
    public var attributes: ElementAttributes
    
    public enum CodingKeys: String, CodingKey {

        case x
        case y
        case width
        case height

    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let x = try container.decodeIfPresent(String.self, forKey: .x).flatMap { Double($0) } ?? 0.0
        let y = try container.decodeIfPresent(String.self, forKey: .y).flatMap { Double($0) } ?? 0.0
        let width = try container.decodeIfPresent(String.self, forKey: .width).flatMap { Double($0) } ?? 0.0
        let height = try container.decodeIfPresent(String.self, forKey: .height).flatMap { Double($0) } ?? 0.0
        self.path = UIBezierPath(rect: CGRect(x: x, y: y, width: width, height: height))
        self.attributes = try ElementAttributes(from: decoder)
    }
    
}
