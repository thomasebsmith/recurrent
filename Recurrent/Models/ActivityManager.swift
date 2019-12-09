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
    private var oldActivities: [Date: [Activity]]
    private var newActivities: [Date: [Activity]]
    private var storedCutoff: Date = activityDateCutoff
    private static let activityStorageName = "ActivityData"
    private static let activityStorageKey = "activity"
    private static let oldStorageName = "oldActivities"
    private static let newStorageName = "newActivities"

    // MARK: - Private methods and getters
    static private var activityDateCutoff: Date {
        Calendar.current.startOfDay(for: Date())
    }
    private func storageDate(for date: Date) -> Date {
        return Calendar.current.startOfDay(for: date)
    }
    private func storageDate(for activity: Activity) -> Date {
        return storageDate(for: activity.date.end)
    }
    private func isNew(_ date: Date) -> Bool {
        return storageDate(for: date) >= storedCutoff
    }
    private func isNew(_ activity: Activity) -> Bool {
        return isNew(activity.date.end)
    }
    private func storageName(for activity: Activity) -> String {
        if isNew(activity) {
            return type(of: self).newStorageName
        }
        return type(of: self).oldStorageName
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
    private func updateCutoff() {
        let newCutoff = type(of: self).activityDateCutoff
        if newCutoff > storedCutoff {
            // We might need to move some activities from new to old
            // TODO: Update dictionaries and Core Data
        } else if newCutoff < storedCutoff {
            // We might need to move some activities from old to new
            // TODO: Update dictionaries and Core Data
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
        if isNew(date) {
            return newActivities[date] ?? []
        }
        return oldActivities[date] ?? []
    }
    init() {
        oldActivities = [:]
        newActivities = [:]
        add(data: type(of: self).oldStorageName, to: &oldActivities)
        add(data: type(of: self).newStorageName, to: &newActivities)
    }
}
