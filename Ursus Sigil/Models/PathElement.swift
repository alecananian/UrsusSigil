//
//  PathElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public class PathElement: Element {
    
    public var d: String
    
    public enum CodingKeys: String, CodingKey {

        case d

    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.d = try container.decodeIfPresent(String.self, forKey: .d) ?? ""
        try super.init(from: decoder)
    }
    
}
