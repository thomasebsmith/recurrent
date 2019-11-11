//
//  ActivityTemplate.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/11/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import Foundation

class ActivityTemplate {
    let attributeMap: AttributeMap
    let fieldsToFill: [AnyAttributeField]
    init(attributeMap: AttributeMap, fieldsToFill: [AnyAttributeField]) {
        self.attributeMap = attributeMap
        self.fieldsToFill = fieldsToFill
    }
}
