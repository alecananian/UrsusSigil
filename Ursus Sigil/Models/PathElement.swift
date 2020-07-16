//
//  PathElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public struct PathElement: Element {
    
    public var d: String
    public var attributes: ElementAttributes
    
    public enum CodingKeys: String, CodingKey {

        case d

    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.d = try container.decodeIfPresent(String.self, forKey: .d) ?? ""
        self.attributes = try ElementAttributes(from: decoder)
    }
    
}
