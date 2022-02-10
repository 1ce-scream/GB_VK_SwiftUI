//
//  CodingStyle.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 10.02.2022.
//

import Foundation

enum Style: String {
    case camelCase = ""
    case snakeCase = "_"
    case kebabCase = "-"
}

@propertyWrapper
struct CodingStyle {
    
    private var value: String
    private let style: Style
    
    init(wrappedValue: String, style: Style) {
        self.value = wrappedValue
        self.style = style
    }
    
    public var wrappedValue: String {
        get {
            get()
        }
        set {
            set(newValue)
        }
    }
    
    //MARK:- private
    private func get() -> String {
        return format(value)
    }
    
    private mutating func set(_ newValue: String) {
        self.value = newValue
    }
    
    private func format(_ string: String) -> String {
        var tmpStr = string
            .replacingOccurrences(of: Style.snakeCase.rawValue, with: " ")
            .replacingOccurrences(of: Style.kebabCase.rawValue, with: " ")
            .lowercased()
        
        var arr = tmpStr
            .split(separator: " ")
            .map { String($0) }
        
        if style == .camelCase {
            arr = arr.map { $0.capitalized }
            if !arr.isEmpty {
                arr[0] = arr[0].lowercased()
            }
        }
        
        tmpStr = arr.joined(separator: style.rawValue)
        return tmpStr
    }
}
