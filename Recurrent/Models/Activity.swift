//
//  Activity.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/11/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

class Activity {
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
}
