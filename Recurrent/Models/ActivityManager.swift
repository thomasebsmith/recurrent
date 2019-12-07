//
//  ActivityManager.swift
//  Recurrent
//
//  Created by Thomas Smith on 12/6/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import CoreData
import UIKit

class ActivityManager {
    private var oldActivities: [Date: [Activity]]
    private var newActivities: [Date: [Activity]]
    private func add(activity: Activity, to array: inout [Activity]?) {
        if array != nil {
            array?.append(activity)
        }
        else {
            array = [activity]
        }
    }
    private func add(data: String, to dict: inout [Date: [Activity]]) {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let request = NSFetchRequest<ActivityData>(entityName: data)
        do {
            let data = try app.persistentContainer.viewContext.fetch(request)
            let list = data.map { dataItem in
                dataItem.activity as? Activity
            }
            for activityData in list {
                if let activity = activityData {
                    let endDate = activity.date.end
                    let endDay = Calendar.current.startOfDay(for: endDate)
                    add(activity: activity, to: &dict[endDay])
                }
            }
        }
        catch {
            return
        }
    }
    init() {
        oldActivities = [:]
        newActivities = [:]
        add(data: "oldActivities", to: &oldActivities)
        add(data: "newActivities", to: &newActivities)
    }
}
