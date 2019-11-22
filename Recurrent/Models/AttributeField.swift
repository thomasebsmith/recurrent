//
//  AttributeField.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/11/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct AttributeFields {
    static let title = AttributeField<String>("title")
    static let backgroundColor = AttributeField<Color>("backgroundColor")
    static let foregroundColor = AttributeField<Color>("foregroundColor")
    static let date = AttributeField<DateInterval>("date")
}

class AnyAttributeField {
    let name: String
    var type: Any.Type {
        return Any.self
    }
    init(_ name: String) {
        self.name = name
    }
}

class AttributeField<T>: AnyAttributeField {
    override var type: Any.Type {
        return T.self
    }
}
