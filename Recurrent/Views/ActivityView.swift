//
//  ActivityView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/19/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct ActivityView: View {
    static let height: CGFloat = 70.0
    let activity: Activity
    var body: some View {
        Text(activity.title)
            .foregroundColor(activity.foregroundColor)
            .widthParent(height: ActivityView.height, alignment: .center)
            .background(activity.backgroundColor)
    }
    init(_ activity: Activity) {
        self.activity = activity
    }
}

struct ActivityView_Previews: PreviewProvider {
    static let activity: Activity = {
        let map = AttributeMap()
        guard map.set(AttributeFields.title, to: "The preview activity") &&
              map.set(AttributeFields.backgroundColor, to: .blue) &&
              map.set(AttributeFields.foregroundColor, to: .white) else {
            print("Couldn't create activity")
            return Activity(attributes: map)
        }
        guard let activity = ActivityTemplate.basic.byFilling(with: map) else {
            print("Couldn't create activity")
            return Activity(attributes: map)
        }
        return activity
    }()
    static var previews: some View {
        ActivityView(activity)
    }
}
