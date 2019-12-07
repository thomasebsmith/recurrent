//
//  Activity.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/11/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import Foundation
import SwiftUI

class Activity: NSObject {
    let attributes: AttributeMap
    init(attributes: AttributeMap) {
        self.attributes = attributes
    }
    var title: String {
        return attributes[AttributeFields.title] ?? ""
    }
    var foregroundColor: Color {
        return attributes[AttributeFields.foregroundColor] ?? .black
    }
    var backgroundColor: Color {
        return attributes[AttributeFields.backgroundColor] ?? .clear
    }
    var date: DateInterval {
        return attributes[AttributeFields.date] ??
                DateInterval(
                    start: Date(timeIntervalSince1970: 0.0),
                    duration: 0.0
                )
    }
    required init?(coder: NSCoder) {
        if let attributes = coder.decodeObject() as? AttributeMap {
            self.attributes = attributes
            return
        }
        return nil
    }
}

extension Activity: NSCoding {
    func encode(with coder: NSCoder) {
        coder.encode(attributes)
    }
}
