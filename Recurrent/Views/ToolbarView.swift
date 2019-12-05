//
//  ToolbarView.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/29/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import SwiftUI

struct ToolbarView<Content>: View where Content: View {
    @State var newActivityPopoverPresented = false
    @State var helpPopoverPresented = false
    var content: () -> Content
    var body: some View {
        NavigationView {
            content()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading: Button("+") {
                    self.newActivityPopoverPresented.toggle()
                }.popover(isPresented: $newActivityPopoverPresented) {
                    NewActivityView(
                        isPresented: self.$newActivityPopoverPresented
                    )
                },
                trailing: Button("?") {
                    self.newActivityPopoverPresented.toggle()
                }.popover(isPresented: $helpPopoverPresented) {
                    HelpView(isPresented: self.$helpPopoverPresented)
                }
            )
        }
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView {
            Spacer()
        }
    }
}
