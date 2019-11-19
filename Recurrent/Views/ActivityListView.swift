//
//  ActivityListView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/15/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct ActivityListView: View {
    var activities: IdentifiableCollection<[Activity]>
    var body: some View {
        VStack {
            ForEach(activities) { activity in
                Text(activity.value.title)
                    .foregroundColor(activity.value.foregroundColor)
                    .background(activity.value.backgroundColor)
            }
        }
    }
}

struct ActivityListView_Previews: PreviewProvider {
    static let firstActivity: Activity = {
        let map = AttributeMap()
        guard map.set(AttributeFields.title, to: "The first activity") &&
              map.set(AttributeFields.backgroundColor, to: .blue) &&
              map.set(AttributeFields.foregroundColor, to: .white) else {
            print("Couldn't create activity")
            return Activity(attributes: map)
        }
        guard let activity = ActivityTemplate.basic.byFilling(with: map) else {
            return Activity(attributes: map)
        }
        return activity
    }()
    static var previews: some View {
        ActivityListView(activities: IdentifiableCollection([
            firstActivity
        ]))
    }
}
