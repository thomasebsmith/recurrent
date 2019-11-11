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
}

class AnyAttributeField {
    let name: String
    init(_ name: String) {
        self.name = name
    }
}

class AttributeField<T>: AnyAttributeField {}
