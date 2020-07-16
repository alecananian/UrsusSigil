//
//  GroupElement.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

public struct GroupElement: Element {
    
    public var path: UIBezierPath
    public var attributes: ElementAttributes
    
    public init(from decoder: Decoder) throws {
        self.path = UIBezierPath()
        self.attributes = try ElementAttributes(from: decoder)
    }
    
}
