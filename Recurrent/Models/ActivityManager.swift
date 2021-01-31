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
    // MARK: - Class members and constants
    private var storedActivities: [Date: [Activity]]
    private static let activityStorageName = "ActivityData"
    private static let activityStorageKey = "activity"

    // MARK: - Private methods and getters
    private func storageDate(for date: Date) -> Date {
        return Calendar.current.startOfDay(for: date)
    }
    private func storageDate(for activity: Activity) -> Date {
        return storageDate(for: activity.date.end)
    }
    private func add(_ activity: Activity, to array: inout [Activity]?) {
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
                    add(activity, to: &dict[storageDate(for: activity)])
                }
            }
        }
        catch {
            return
        }
    }

    // MARK: - Public interface
    func add(activity: Activity) -> Bool {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            return false
        }
        guard let entity = NSEntityDescription.entity(
            forEntityName: type(of: self).activityStorageName,
            in: app.persistentContainer.viewContext
        ) else {
                return false
        }
        let object = ActivityData(
            entity: entity,
            insertInto: app.persistentContainer.viewContext
        )
        object.setValue(activity, forKey: type(of: self).activityStorageKey)
        do {
            try app.persistentContainer.viewContext.save()
        } catch {
            return false
        }
        return true
    }
    func activities(on date: Date) -> [Activity] {
        return storedActivities[date] ?? []
    }
    init() {
        storedActivities = [:]
        add(data: type(of: self).activityStorageName, to: &storedActivities)
    }
}
