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

    // MARK: - UI
    var body: some View {
        ToolbarView {
            VStack {
                Text("Content here")
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
