//
//  ToolbarView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/29/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct ToolbarView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: NewActivityView()) {
                Text("+")
            }.padding()
            Spacer()
            NavigationLink(destination: HelpView()) {
                Text("?")
            }.padding()
        }
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView()
    }
}
