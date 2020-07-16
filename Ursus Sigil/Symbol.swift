//
//  Symbol.swift
//  Alamofire
//
//  Created by Daniel Clelland on 14/07/20.
//

import Foundation

public struct Symbol: Decodable {
    
    public enum Name: String, Decodable {
        
        case rect
        case circle
        case line
        case path
        case group = "g"
    
    }
    
    public enum Attribute: String, CodingKey {
        
        case clipRule = "clip-rule"
        case cx
        case cy
        case d
        case fill
        case fillRule = "fill-rule"
        case height
        case r
        case stroke
        case strokeLinecap = "stroke-linecap"
        case strokeWidth = "stroke-width"
        case transform
        case width
        case x1
        case x2
        case y1
        case y2
        
    }
    
    public var name: Name
    public var attributes: [Attribute: String]
    public var children: [Symbol]
    
    enum CodingKeys: String, CodingKey {
        case name
        case attributes
        case children
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let attributesContainer = try container.nestedContainer(keyedBy: Attribute.self, forKey: .attributes)
        self.name = try container.decode(Name.self, forKey: .name)
        self.attributes = Dictionary(
            uniqueKeysWithValues: try attributesContainer.allKeys.map { key in
                return (key, try attributesContainer.decode(String.self, forKey: key))
            }
        )
        self.children = try container.decode([Symbol].self, forKey: .children)
    }
    
}

extension Symbol {
    
    public static var all: [String: Symbol] = {
        do {
            let data = try Data(contentsOf: Bundle.ursusSigil.urlForSymbols())
            let symbols = try JSONDecoder().decode([String: Symbol].self, from: data)
            return symbols
        } catch let error {
            print("Sigil error", error)
            return [:]
        }
    }()
    
}

extension Symbol {

    public func svgData(backgroundColor: String = "#FFFFFF", foregroundColor: String = "#000000") -> Data {
        return svgString(backgroundColor: backgroundColor, foregroundColor: foregroundColor).data(using: .utf8) ?? Data()
    }

    public func svgString(backgroundColor: String = "#FFFFFF", foregroundColor: String = "#000000") -> String {
        return "<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" viewBox=\"0 0 128 128\">\(svgElement(backgroundColor: backgroundColor, foregroundColor: foregroundColor))</svg>"
    }

    private func svgElement(backgroundColor: String = "#FFFFFF", foregroundColor: String = "#000000") -> String {
        let modifiedAttributes: [Attribute: String] = Dictionary(
            uniqueKeysWithValues: attributes.map { key, value in
                switch (key, value) {
                case (.fill, "@BG"):
                    return (key, backgroundColor)
                case (.fill, "@FG"):
                    return (key, foregroundColor)
                case (.stroke, "@BG"):
                    return (key, backgroundColor)
                case (.stroke, "@FG"):
                    return (key, foregroundColor)
                default:
                    return (key, value)
                }
            }
        )

        return "<\(name) \(modifiedAttributes.map { "\($0.rawValue)=\"\($1)\"" }.joined(separator: " "))>\(children.map { $0.svgElement(backgroundColor: backgroundColor, foregroundColor: foregroundColor) }.joined())</\(name)>"
    }

}
