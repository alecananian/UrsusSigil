//
//  Symbol.swift
//  Alamofire
//
//  Created by Daniel Clelland on 14/07/20.
//

import Foundation

internal struct Symbol: Decodable {
    
    static var all: [String: Symbol] = {
        return Bundle(identifier: "org.cocoapods.Ursus").flatMap { bundle in
            return bundle.url(forResource: "index", withExtension: "json")
        }.flatMap { url in
            return try? Data(contentsOf: url)
        }.flatMap { data in
            return try? JSONDecoder().decode([String: Symbol].self, from: data)
        } ?? [:]
    }()
    
    var name: String
    var attributes: [String: String]
    var children: [Symbol]
    
}

extension Symbol {
    
    public func svgData(backgroundColor: String = "#000000", foregroundColor: String = "#FFFFFF") -> Data {
        return svgString(backgroundColor: backgroundColor, foregroundColor: foregroundColor).data(using: .utf8) ?? Data()
    }
    
    public func svgString(backgroundColor: String = "#000000", foregroundColor: String = "#FFFFFF") -> String {
        return "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" viewBox=\"0 0 128 128\">\(svgElement(backgroundColor: backgroundColor, foregroundColor: foregroundColor))</svg>"
    }
    
    private func svgElement(backgroundColor: String = "#000000", foregroundColor: String = "#FFFFFF") -> String {
        let modifiedAttributes: [String: String] = Dictionary(
            uniqueKeysWithValues: attributes.map { key, value in
                switch (key, value) {
                case ("fill", "@BG"):
                    return (key, backgroundColor)
                case ("fill", "@FG"):
                    return (key, foregroundColor)
                case ("stroke", "@BG"):
                    return (key, backgroundColor)
                case ("stroke", "@FG"):
                    return (key, foregroundColor)
                default:
                    return (key, value)
                }
            }
        )
        
        return "<\(name) \(modifiedAttributes.map { "\($0)=\"\($1)\"" }.joined(separator: " "))>\(children.map { $0.svgElement(backgroundColor: backgroundColor, foregroundColor: foregroundColor) }.joined())</\(name)>"
    }
    
}
