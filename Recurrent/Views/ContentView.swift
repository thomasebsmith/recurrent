//
//  ContentView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/11/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import CoreData
import SwiftUI

struct ContentView: View {
    // MARK: - Class members
    let manager = ActivityManager()
    
    private func getTodayActivitiesView() -> ActivityListView {
        let today = Calendar.current.startOfDay(for: Date())
        let tomorrow = Calendar.current.date(
            byAdding: .day,
            value: 1,
            to: today
        ) ?? today
        return ActivityListView(
            activities: IdentifiableCollection(manager.activities(on: today)),
            listTimeSpan: DateInterval(start: today, end: tomorrow)
        )
    }

    // MARK: - UI
    var body: some View {
        ToolbarView {
            VStack {
                getTodayActivitiesView()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    // MARK: - Static members
    static var previews: some View {
        ContentView()
    }
}
