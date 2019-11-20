//
//  View+widthParent.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/19/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

extension View {
    public func widthParent(
        height: CGFloat? = nil,
        alignment: Alignment = .topLeading
    ) -> some View {
        return frame(
            minWidth: 0,
            idealWidth: nil,
            maxWidth: .infinity,
            minHeight: 0,
            idealHeight: height,
            maxHeight: height,
            alignment: alignment
        )
    }
}
