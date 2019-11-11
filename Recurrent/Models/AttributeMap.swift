//
//  AttributeMap.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/11/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import Foundation

class AttributeMap {
    private struct AttributeValue {
        var editable: Bool
        var value: Any
    }
    private struct NoValue {}

    private var map: [String: AttributeValue] = [:]

    func set<T>(_ field: AttributeField<T>, to value: T) -> Bool {
        if map[field.name]?.editable != false {
            map[field.name] = AttributeValue(editable: true, value: value)
            return true
        }
        return false
    }
    func canSet<T>(field: AttributeField<T>) -> Bool {
        return map[field.name]?.editable ?? true
    }
    func stopEdits<T>(_ field: AttributeField<T>) {
        if map[field.name] != nil {
            map[field.name]?.editable = false
        }
        else {
            map[field.name] = AttributeValue(editable: false, value: NoValue())
        }
    }
    subscript<T>(field: AttributeField<T>) -> T? {
        return map[field.name]?.value as? T
    }
}
