//
//  PathElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation
import SwiftSVG

public struct PathElement: Element {
    
    public var path: UIBezierPath
    public var attributes: ElementAttributes
    
    public enum CodingKeys: String, CodingKey {

        case d

    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let d = try container.decodeIfPresent(String.self, forKey: .d) ?? ""
        self.path = UIBezierPath(pathString: d)
        self.attributes = try ElementAttributes(from: decoder)
    }
    
}
