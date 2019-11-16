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
        var type: Any.Type
        var value: Any
    }
    private struct NoValue {}

    private var map: [String: AttributeValue]
    
    private init(preparedMap: [String: AttributeValue]) {
        self.map = preparedMap
    }
    
    init() {
        self.map = [:]
    }

    func set<T>(_ field: AttributeField<T>, to value: T) -> Bool {
        if map[field.name]?.editable != false {
            map[field.name] = AttributeValue(editable: true, type: T.self, value: value)
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
            map[field.name] = AttributeValue(editable: false, type: T.self, value: NoValue())
        }
    }
    func fills(_ fieldList: [AnyAttributeField]) -> Bool {
        for field in fieldList {
            if map[field.name]?.type != field.type {
                return false
            }
        }
        return true
    }
    func union(with otherMap: AttributeMap) -> AttributeMap {
        var mapCopy = map
        mapCopy.merge(otherMap.map, uniquingKeysWith: { left, _ in
            left
        })
        return AttributeMap(preparedMap: mapCopy)
    }
    subscript<T>(field: AttributeField<T>) -> T? {
        guard let storedValue = map[field.name] else {
            return nil
        }
        guard storedValue.type == T.self else {
            return nil
        }
        return map[field.name]?.value as? T
    }
}
