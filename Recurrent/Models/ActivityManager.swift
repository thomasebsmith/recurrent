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
    private let oldActivities: [Date: [Activity]]
    private let newActivities: [Date: [Activity]]
    init() {
        oldActivities = [:]
        newActivities = [:]
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let oldRequest = NSFetchRequest<ActivityData>(
            entityName: "oldActivities"
        )
        do {
            let oldData = try app.persistentContainer.viewContext.fetch(
                oldRequest
            )
            let oldActivityList = oldData.map { data in
                data.activity as? Activity
            }
            for activity in oldActivityList {
                if let activity = activity {
                    let endDate = activity.date.end
                    let endDay = Calendar.current.startOfDay(for: endDate)
                    // TODO
                }
            }
            // TODO: Work on new activities
        }
        catch {
            return
        }
    }
}
