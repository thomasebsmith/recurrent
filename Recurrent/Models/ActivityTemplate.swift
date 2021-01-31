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
    func byFilling(with attributes: AttributeMap) -> Activity? {
        guard attributes.fills(self.fieldsToFill) else {
            return nil
        }
        return Activity(attributes: attributes.union(with: self.attributeMap))
    }
}

extension ActivityTemplate {
    static let basic: ActivityTemplate = {
        let map = AttributeMap()
        return ActivityTemplate(attributeMap: map, fieldsToFill: [
            AttributeFields.title,
            AttributeFields.backgroundColor,
            AttributeFields.foregroundColor,
            AttributeFields.date
        ])
    }()
}
