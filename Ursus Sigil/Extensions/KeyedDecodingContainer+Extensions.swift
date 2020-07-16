//
//  KeyedDecodingContainer+Extensions.swift
//  Alamofire
//
//  Created by Daniel Clelland on 16/07/20.
//

import Foundation

extension KeyedDecodingContainer {
    
    internal func decodeFromString<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T : LosslessStringConvertible {
        let string = try decode(String.self, forKey: key)
        switch T(string) {
        case .none:
            throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "String conversion failed: \(string)")
        case .some(let value):
            return value
        }
    }
    
    internal func decodeFromString<T>(_ type: T?.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T? where T : LosslessStringConvertible {
        let string = try decode(String?.self, forKey: key)
        return try string.map { string in
            switch T(string) {
            case .none:
                throw DecodingError.dataCorruptedError(forKey: key, in: self, debugDescription: "String conversion failed: \(string)")
            case .some(let value):
                return value
            }
        }
    }
    
}
