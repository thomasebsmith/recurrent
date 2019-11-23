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
    var listTimeSpan: DateInterval
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ForEach(self.activities) { activity in
                    ActivityView(activity.value)
                        .position(self.position(for: activity, with: geometry))
                }
            }
        }
    }
    func position(
        for activity: IdentifiableCollection<[Activity]>.IdentifiableElement,
        with geometry: GeometryProxy
    ) -> CGPoint {
        let interval = activity.value.date
        let timeDifference = listTimeSpan.start.distance(to: interval.start)
        let y = timeDifference / ActivityView.secondsPerHeight +
            interval.duration / ActivityView.secondsPerHeight / 2
        return CGPoint(x: Double(geometry.size.width / 2), y: y)
    }
}

struct ActivityListView_Previews: PreviewProvider {
    static let firstActivity: Activity = {
        let map = AttributeMap()
        let date = DateInterval(
            start: Date(timeIntervalSinceNow: -2*60*60),
            duration: 2*60*60
        )
        guard map.set(AttributeFields.title, to: "The first activity") &&
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
    static let secondActivity: Activity = {
        let map = AttributeMap()
        let date = DateInterval(
            start: Date(timeIntervalSinceNow: 0*60*60),
            duration: 1*60*60
        )
        guard map.set(AttributeFields.title, to: "The second activity") &&
              map.set(AttributeFields.backgroundColor, to: .yellow) &&
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
        let today = Calendar.current.startOfDay(for: Date())
        let tomorrow = Calendar.current.date(
            byAdding: .day,
            value: 1,
            to: today
        ) ?? today
        return ActivityListView(
            activities: IdentifiableCollection([
                firstActivity,
                secondActivity
            ]),
            listTimeSpan: DateInterval(start: today, end: tomorrow)
        )
    }
}
