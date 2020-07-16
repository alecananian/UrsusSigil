//
//  Element.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

@propertyWrapper public struct DecodableFromString<Value>: Decodable where Value: LosslessStringConvertible {
    
    public var wrappedValue: Value
    
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        
        self.wrappedValue = try {
            switch Value(string) {
            case .none:
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "String conversion failed: \(string)")
            case .some(let value):
                return value
            }
        }()
    }
    
}

@propertyWrapper public struct OptionalDecodableFromString<Value>: Decodable where Value: LosslessStringConvertible {
    
    public var wrappedValue: Value?
    
    public init(wrappedValue: Value?) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String?.self)
        
        self.wrappedValue = try string.map { string in
            switch Value(string) {
            case .none:
                throw DecodingError.dataCorruptedError(in: container, debugDescription: "String conversion failed: \(string)")
            case .some(let value):
                return value
            }
        }
    }
    
}

public protocol Element: Decodable {
    
    //    public enum Attribute: String, CodingKey {
    //
    //        case clipRule = "clip-rule"
    //        case cx
    //        case cy
    //        case d
    //        case fill
    //        case fillRule = "fill-rule"
    //        case height
    //        case r
    //        case stroke
    //        case strokeLinecap = "stroke-linecap"
    //        case strokeWidth = "stroke-width"
    //        case transform
    //        case width
    //        case x1
    //        case x2
    //        case y1
    //        case y2
    //
    //    }
    
}
