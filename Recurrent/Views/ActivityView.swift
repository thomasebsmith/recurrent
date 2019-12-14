//
//  ActivityView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/19/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct ActivityView: View {
    // MARK: - Class members
    let activity: Activity
    let secondsPerHeight: Double
    // MARK: - UI
    var body: some View {
        Text(activity.title)
            .foregroundColor(activity.foregroundColor)
            .widthParent(height: height, alignment: .center)
            .background(activity.backgroundColor)
            .onTapGesture {
                print("Activity \(self.activity.title) tapped")
            }
    }
    // MARK: - Computed properties
    var height: CGFloat {
        return CGFloat(activity.date.duration / secondsPerHeight)
    }
    // MARK: - Initializers
    init(_ activity: Activity, secondsPerHeight: Double = 200.0) {
        self.activity = activity
        self.secondsPerHeight = secondsPerHeight
    }
}

struct ActivityView_Previews: PreviewProvider {
    // MARK: - Static members
    static let activity: Activity = {
        let map = AttributeMap()
        let date = DateInterval(start: Date(), duration: 4*60*60)
        guard map.set(AttributeFields.title, to: "The preview activity") &&
              map.set(AttributeFields.backgroundColor, to: .blue) &&
              map.set(AttributeFields.foregroundColor, to: .white) &&
              map.set(AttributeFields.date, to: date)
        else {
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
